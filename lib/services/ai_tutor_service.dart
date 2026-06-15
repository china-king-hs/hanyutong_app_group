import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

/// AI 导师对话服务
///
/// 基于通义千问（qwen-turbo）的多轮对话，作为用户的中文学习导师。
/// 复用 DashScope API，通过 system prompt 注入角色和学习上下文。
class AiTutorService {
  static const String _model = 'qwen-turbo';
  static const String _baseUrl =
      'https://dashscope.aliyuncs.com/api/v1/services/aigc/text-generation/generation';

  // 与 AiService 共用同一 API Key
  static const String _apiKey = 'sk-70155f8874904b399d684634e083d02c';

  // 语言代码 → 语言名称
  static const Map<String, String> _languageNames = {
    'en': 'English',
    'ru': 'Russian',
    'tr': 'Turkish',
    'ar': 'Arabic',
    'fa': 'Persian',
  };

  // 难度 → HSK 等级描述
  static const Map<String, String> _levelDescriptions = {
    'beginner': 'HSK 1-2 (beginner)',
    'elementary': 'HSK 3-4 (elementary)',
    'intermediate': 'HSK 4-5 (intermediate)',
    'advanced': 'HSK 6-9 (advanced)',
  };

  // 对话历史（多轮）
  final List<Map<String, String>> _messages = [];

  /// 构建导师 system prompt
  ///
  /// [languageCode] 用户母语代码（en/ru/tr/ar/fa）
  /// [level] 用户当前难度（beginner/elementary/intermediate/advanced）
  /// [currentContent] 当前正在学习的内容描述
  /// [masteredCount] 已掌握数量（可选）
  String _buildSystemPrompt({
    required String languageCode,
    required String level,
    required String currentContent,
    int masteredCount = 0,
  }) {
    final langName = _languageNames[languageCode] ?? 'English';
    final levelDesc = _levelDescriptions[level] ?? 'beginner';

    return '''你是一位专业的中文教师，正在教一位 $langName 母语的学习者中文。

学习者信息：
- 母语：$langName
- 当前水平：$levelDesc
- 已掌握词汇数量：$masteredCount
- 当前正在学习：$currentContent

教学规则：
1. 用 $langName 回复学习者（解释语法、词义、文化背景时使用 $langName）
2. 当学习者犯错时，温柔地纠正并解释原因，不要严厉
3. 主动用当前学习的词汇/成语/谚语造句，帮助学习者理解用法
4. 回复要简洁明了，每次回复控制在 2-4 句话以内
5. 鼓励学习者多练习，保持积极的学习氛围
6. 如果学习者问的问题超出当前学习范围，也可以回答，但要标注难度
7. 适当使用拼音标注生词的读音
8. 如果学习者用中文提问或回答，用中文简单回复，然后用 $langName 解释

当前上下文：用户正在学习页面中查看 "$currentContent"，你可以围绕这个内容展开教学。''';
  }

  /// 开始新对话（重置历史并设置 system prompt）
  void startConversation({
    required String languageCode,
    required String level,
    required String currentContent,
    int masteredCount = 0,
  }) {
    _messages.clear();
    _messages.add({
      'role': 'system',
      'content': _buildSystemPrompt(
        languageCode: languageCode,
        level: level,
        currentContent: currentContent,
        masteredCount: masteredCount,
      ),
    });
  }

  /// 发送消息并获取导师回复
  ///
  /// [userMessage] 用户输入的文本消息
  /// 返回导师的回复文本
  Future<String> sendMessage(String userMessage) async {
    if (_messages.isEmpty) {
      throw Exception('请先调用 startConversation() 初始化对话');
    }

    // 添加用户消息
    _messages.add({
      'role': 'user',
      'content': userMessage,
    });

    debugPrint('🧑‍🏫 导师对话: 用户消息="${userMessage.substring(0, userMessage.length > 50 ? 50 : userMessage.length)}..."');

    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {
          'Authorization': 'Bearer $_apiKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'model': _model,
          'input': {
            'messages': _messages,
          },
          'parameters': {
            'result_format': 'message',
            'temperature': 0.7, // 适中温度，兼顾准确性和自然度
          },
        }),
      );

      if (response.statusCode != 200) {
        debugPrint('🧑‍🏫 导师 API 错误: ${response.statusCode} ${response.body}');
        throw Exception('API request failed: ${response.statusCode}');
      }

      final data = jsonDecode(response.body);
      final content =
          data['output']?['choices']?[0]?['message']?['content'] as String?;

      if (content == null || content.isEmpty) {
        throw Exception('API returned empty content');
      }

      // 添加助手回复到历史
      _messages.add({
        'role': 'assistant',
        'content': content,
      });

      // 保留最近 20 条消息（防止上下文过长）
      _trimMessages();

      debugPrint('🧑‍🏫 导师回复: "${content.substring(0, content.length > 80 ? 80 : content.length)}..."');
      return content;
    } catch (e) {
      debugPrint('🧑‍🏫 导师异常: $e');
      // 移除刚才失败的用户消息
      if (_messages.isNotEmpty && _messages.last['role'] == 'user') {
        _messages.removeLast();
      }
      rethrow;
    }
  }

  /// 修剪对话历史，保留 system prompt + 最近 20 条消息
  void _trimMessages() {
    if (_messages.length > 21) {
      // 保留 system prompt (index 0) + 最近 20 条
      final systemMsg = _messages.first;
      final recent = _messages.sublist(_messages.length - 20);
      _messages.clear();
      _messages.add(systemMsg);
      _messages.addAll(recent);
    }
  }

  /// 清空对话历史
  void clearHistory() {
    _messages.clear();
  }

  /// 获取当前对话消息数（不含 system prompt）
  int get messageCount => _messages.length > 1 ? _messages.length - 1 : 0;

  /// 是否已初始化对话
  bool get isInitialized => _messages.isNotEmpty;
}
