import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';
import '../app_state.dart';
import '../l10n/app_localizations.dart';
import '../services/ai_tutor_service.dart';
import '../services/ai_service.dart';
import '../services/tts_service.dart';
import '../utils/rtl_utils.dart';

/// AI 导师对话面板
///
/// 从底部弹出的对话界面，支持文字输入和语音输入。
/// 自动获取当前学习内容作为上下文。
class TutorChatPanel extends StatefulWidget {
  /// 当前学习的内容描述（如词汇、成语名称）
  final String currentContent;

  /// 学习模块名称（如 "词汇学习"、"成语学习"）
  final String moduleName;

  const TutorChatPanel({
    super.key,
    required this.currentContent,
    required this.moduleName,
  });

  /// 显示对话面板（底部弹出）
  static Future<void> show({
    required BuildContext context,
    required String currentContent,
    required String moduleName,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => TutorChatPanel(
        currentContent: currentContent,
        moduleName: moduleName,
      ),
    );
  }

  @override
  State<TutorChatPanel> createState() => _TutorChatPanelState();
}

class _TutorChatPanelState extends State<TutorChatPanel> {
  final AiTutorService _tutorService = AiTutorService();
  final AiService _aiService = AiService();
  final TtsService _ttsService = TtsService();
  final AudioRecorder _audioRecorder = AudioRecorder();

  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();

  final List<_ChatMessage> _messages = [];
  bool _isLoading = false;
  bool _isRecording = false;
  bool _isRecordingVoice = false; // true = 正在录音为导师输入
  String? _recordedPath;
  bool _isSendingVoice = false;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    // 延迟到第一帧后再初始化，避免在 initState 中访问 InheritedWidget
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_initialized && mounted) {
        _initialized = true;
        _initConversation();
      }
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    _focusNode.dispose();
    _audioRecorder.dispose();
    _ttsService.dispose();
    super.dispose();
  }

  /// 初始化导师对话
  void _initConversation() {
    final state = context.read<AppState>();
    final loc = AppLocalizations.of(context)!;

    _tutorService.startConversation(
      languageCode: state.language,
      level: state.level,
      currentContent: widget.currentContent,
      masteredCount: state.masteredWords + state.masteredIdioms + state.masteredProverbs,
    );

    // 添加欢迎消息
    final welcomeMsg = _getWelcomeMessage(loc, state.language);
    setState(() {
      _messages.add(_ChatMessage(
        role: 'assistant',
        content: welcomeMsg,
        timestamp: DateTime.now(),
      ));
    });
  }

  /// 获取欢迎消息
  String _getWelcomeMessage(AppLocalizations loc, String language) {
    // 根据用户母语返回对应的欢迎语
    final greetings = {
      'en': 'Hi! I\'m your Chinese tutor. You\'re currently learning: ${widget.currentContent}. Feel free to ask me anything about it!',
      'ru': 'Привет! Я ваш преподаватель китайского. Сейчас вы изучаете: ${widget.currentContent}. Спрашивайте о чём угодно!',
      'tr': 'Merhaba! Ben Çince öğretmeninizim. Şu anda çalışıyorsunuz: ${widget.currentContent}. Ne sormak isterseniz sorun!',
      'fa': 'سلام! من معلم زبان چینی شما هستم. در حال مطالعه هستید: ${widget.currentContent}. هر سوالی دارید بپرسید!',
      'ar': 'مرحبا! أنا معلم اللغة الصينية الخاص بك. أنت تتعلم حالياً: ${widget.currentContent}. اسألني أي شيء!',
    };
    return greetings[language] ??
        greetings['en']!;
  }

  /// 发送文字消息
  Future<void> _sendTextMessage() async {
    final text = _textController.text.trim();
    if (text.isEmpty || _isLoading) return;

    _textController.clear();
    _focusNode.unfocus();

    setState(() {
      _messages.add(_ChatMessage(
        role: 'user',
        content: text,
        timestamp: DateTime.now(),
      ));
      _isLoading = true;
    });

    _scrollToBottom();

    try {
      final reply = await _tutorService.sendMessage(text);
      if (mounted) {
        setState(() {
          _messages.add(_ChatMessage(
            role: 'assistant',
            content: reply,
            timestamp: DateTime.now(),
          ));
          _isLoading = false;
        });
        _scrollToBottom();
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _messages.add(_ChatMessage(
            role: 'assistant',
            content: 'Sorry, something went wrong. Please try again.',
            isError: true,
            timestamp: DateTime.now(),
          ));
          _isLoading = false;
        });
        _scrollToBottom();
      }
    }
  }

  /// 语音输入 → ASR → 发送给导师
  Future<void> _handleVoiceInput() async {
    if (_isRecordingVoice || _isLoading) return;

    // 检查麦克风权限
    bool granted;
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      granted = await _audioRecorder.hasPermission();
    } else {
      final status = await Permission.microphone.request();
      granted = status.isGranted;
    }

    if (!granted) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Microphone permission required')),
        );
      }
      return;
    }

    final dir = await getTemporaryDirectory();
    final path =
        '${dir.path}/tutor_${DateTime.now().millisecondsSinceEpoch}.m4a';

    setState(() => _isRecordingVoice = true);

    await _audioRecorder.start(
      const RecordConfig(encoder: AudioEncoder.aacLc),
      path: path,
    );

    // 录音 5 秒后自动停止
    Future.delayed(const Duration(seconds: 5), () async {
      if (_isRecordingVoice) {
        final recordedPath = await _audioRecorder.stop();
        if (recordedPath != null && mounted) {
          await _sendVoiceMessage(recordedPath);
        }
      }
    });
  }

  /// 停止录音并发送
  Future<void> _stopAndSendVoice() async {
    if (!_isRecordingVoice) return;
    final path = await _audioRecorder.stop();
    if (path != null && mounted) {
      await _sendVoiceMessage(path);
    }
  }

  /// 将语音转为文字并发送给导师
  Future<void> _sendVoiceMessage(String audioPath) async {
    setState(() {
      _isRecordingVoice = false;
      _isSendingVoice = true;
    });

    try {
      final state = context.read<AppState>();
      // 用用户母语进行 ASR
      final transcript = await _aiService.transcribeAudio(
        audioPath,
        languageHint: state.language,
      );

      if (transcript.isNotEmpty && mounted) {
        await _sendTextMessageWith(transcript);
      }
    } catch (e) {
      debugPrint('🧑‍🏫 语音输入失败: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Voice input failed, please try again')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSendingVoice = false);
      }
      // 清理临时文件
      try {
        File(audioPath).deleteSync();
      } catch (_) {}
    }
  }

  /// 用预填文本发送消息
  Future<void> _sendTextMessageWith(String text) async {
    setState(() {
      _messages.add(_ChatMessage(
        role: 'user',
        content: text,
        timestamp: DateTime.now(),
      ));
      _isLoading = true;
    });
    _scrollToBottom();

    try {
      final reply = await _tutorService.sendMessage(text);
      if (mounted) {
        setState(() {
          _messages.add(_ChatMessage(
            role: 'assistant',
            content: reply,
            timestamp: DateTime.now(),
          ));
          _isLoading = false;
        });
        _scrollToBottom();
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _messages.add(_ChatMessage(
            role: 'assistant',
            content: 'Sorry, something went wrong. Please try again.',
            isError: true,
            timestamp: DateTime.now(),
          ));
          _isLoading = false;
        });
        _scrollToBottom();
      }
    }
  }

  /// TTS 朗读导师回复
  Future<void> _speakReply(String text) async {
    // 提取中文部分进行朗读（忽略非中文字符）
    final chineseText = text.runes
        .where((rune) => rune >= 0x4E00 && rune <= 0x9FFF)
        .map((rune) => String.fromCharCode(rune))
        .join();
    if (chineseText.isNotEmpty) {
      await _ttsService.speak(chineseText);
    }
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final languageCode = context.watch<AppState>().language;
    final bool isRtl = isRTL(languageCode);

    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          // Handle bar + Title
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xFFE0E0E0))),
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFFCCCCCC),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    loc.askTeacher,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                ),
                // 当前学习内容标签
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFDCEAFF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    widget.currentContent,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFF4285F4),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close, color: Color(0xFF999999)),
                ),
              ],
            ),
          ),

          // 学习模块提示
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: const Color(0xFFF8F9FA),
            child: Row(
              children: [
                const Icon(Icons.school, size: 16, color: Color(0xFF4285F4)),
                const SizedBox(width: 6),
                Text(
                  '${loc.askTeacherContext} ${widget.moduleName}: ${widget.currentContent}',
                  style: const TextStyle(fontSize: 12, color: Color(0xFF666666)),
                ),
              ],
            ),
          ),

          // Messages list
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length + (_isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == _messages.length) {
                  // Loading indicator
                  return _buildLoadingBubble(isRtl);
                }
                final msg = _messages[index];
                return _buildMessageBubble(msg, isRtl);
              },
            ),
          ),

          // Input area
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Color(0xFFE0E0E0))),
            ),
            child: SafeArea(
              top: false,
              child: Row(
                children: [
                  // Voice input button
                  GestureDetector(
                    onTap: _isRecordingVoice ? _stopAndSendVoice : _handleVoiceInput,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: _isRecordingVoice
                            ? const Color(0xFF4285F4)
                            : const Color(0xFFF5F5F5),
                        shape: BoxShape.circle,
                      ),
                      child: _isSendingVoice
                          ? const Padding(
                              padding: EdgeInsets.all(10),
                              child: CircularProgressIndicator(
                                color: Color(0xFF4285F4),
                                strokeWidth: 2,
                              ),
                            )
                          : Icon(
                              _isRecordingVoice ? Icons.stop : Icons.mic,
                              color: _isRecordingVoice
                                  ? Colors.white
                                  : const Color(0xFF666666),
                              size: 20,
                            ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Text input
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        controller: _textController,
                        focusNode: _focusNode,
                        textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
                        decoration: InputDecoration(
                          hintText: loc.askTeacherHint,
                          hintStyle: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFFBBBBBB),
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                        ),
                        style: const TextStyle(fontSize: 14),
                        onSubmitted: (_) => _sendTextMessage(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Send button
                  GestureDetector(
                    onTap: _sendTextMessage,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF4285F4),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 构建消息气泡
  Widget _buildMessageBubble(_ChatMessage msg, bool isRtl) {
    final isUser = msg.role == 'user';
    final loc = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser) ...[
            // 导师头像
            Container(
              width: 32,
              height: 32,
              margin: const EdgeInsets.only(right: 8, top: 2),
              decoration: BoxDecoration(
                color: const Color(0xFF4285F4),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.school, color: Colors.white, size: 18),
            ),
          ],
          Flexible(
            child: Column(
              crossAxisAlignment:
                  isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: isUser
                        ? const Color(0xFF4285F4)
                        : msg.isError
                            ? const Color(0xFFFFEBEE)
                            : const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(16),
                      topRight: const Radius.circular(16),
                      bottomLeft: Radius.circular(isUser ? 16 : 4),
                      bottomRight: Radius.circular(isUser ? 4 : 16),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        msg.content,
                        style: TextStyle(
                          fontSize: 14,
                          color: isUser
                              ? Colors.white
                              : msg.isError
                                  ? Colors.red
                                  : const Color(0xFF333333),
                          height: 1.5,
                        ),
                        textDirection: isRtl && !isUser
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                      ),
                      if (!isUser && !msg.isError) ...[
                        const SizedBox(height: 6),
                        // TTS 播放按钮
                        GestureDetector(
                          onTap: () => _speakReply(msg.content),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.volume_up,
                                size: 14,
                                color: Color(0xFF4285F4),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                loc.tutorPlayChinese,
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFF4285F4),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 构建加载指示器
  Widget _buildLoadingBubble(bool isRtl) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            margin: const EdgeInsets.only(right: 8, top: 2),
            decoration: const BoxDecoration(
              color: Color(0xFF4285F4),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.school, color: Colors.white, size: 18),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const SizedBox(
              width: 60,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 8,
                    height: 8,
                    child: CircularProgressIndicator(
                      color: Color(0xFF4285F4),
                      strokeWidth: 2,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    '...',
                    style: TextStyle(fontSize: 14, color: Color(0xFF999999)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 对话消息数据模型
class _ChatMessage {
  final String role; // 'user' or 'assistant'
  final String content;
  final DateTime timestamp;
  final bool isError;

  const _ChatMessage({
    required this.role,
    required this.content,
    required this.timestamp,
    this.isError = false,
  });
}
