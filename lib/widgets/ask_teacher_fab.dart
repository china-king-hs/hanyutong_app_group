import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import 'tutor_chat_panel.dart';

/// "问老师"浮动按钮
///
/// 放置在学习模块页面底部的悬浮按钮，点击弹出 AI 导师对话面板。
/// 自动传入当前学习内容作为上下文。
class AskTeacherFab extends StatelessWidget {
  /// 当前正在学习的内容（如词汇、成语名称）
  final String currentContent;

  /// 学习模块名称（如 "Words"、"Idioms"）
  final String moduleName;

  const AskTeacherFab({
    super.key,
    required this.currentContent,
    required this.moduleName,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Positioned(
      right: 16,
      bottom: 16,
      child: GestureDetector(
        onTap: () => _openChat(context),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xFF4285F4),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF4285F4).withValues(alpha: 0.3),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.school, color: Colors.white, size: 18),
              const SizedBox(width: 6),
              Text(
                loc.askTeacher,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openChat(BuildContext context) {
    TutorChatPanel.show(
      context: context,
      currentContent: currentContent,
      moduleName: moduleName,
    );
  }
}
