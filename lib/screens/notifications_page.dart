import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../l10n/app_localizations.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          // 顶部标题栏
          Container(
            color: Colors.white,
            child: SafeArea(
              bottom: false,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Color(0xFFE0E0E0)))),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(Icons.arrow_back, color: Color(0xFF333333)),
                    ),
                    Text(
                      loc.notifications,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold,
                          color: Color(0xFF333333)),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 暂无通知主体
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.notifications_none_outlined,
                    size: 72,
                    color: Color(0xFFCCCCCC),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    loc.noNotifications,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF666666)),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    loc.noNotificationsDesc,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF999999)),
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
