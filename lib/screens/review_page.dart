import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../l10n/app_localizations.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    
    // 创建本地化的复习类型列表
    final reviewTypes = [
      {'emoji': '📝', 'title': loc.wordsReview, 'path': '/words-review'},
      {'emoji': '📖', 'title': loc.idiomsReview, 'path': '/idioms-review'},
      {'emoji': '💡', 'title': loc.proverbsReview, 'path': '/proverbs-review'},
    ];
    
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          // Header
          Container(
            color: Colors.white,
            child: SafeArea(
              bottom: false,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: const BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Color(0xFFE0E0E0)))),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(Icons.arrow_back,
                          color: Color(0xFF333333)),
                    ),
                    Text(loc.reviewTitle,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ),
          // Content
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(24),
              itemCount: reviewTypes.length,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (_, i) {
                final type = reviewTypes[i];
                return GestureDetector(
                  onTap: () => context.push(type['path']!),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withValues(alpha: 0.06),
                            blurRadius: 6,
                            offset: const Offset(0, 2))
                      ],
                    ),
                    child: Row(
                      children: [
                        Text(type['emoji']!,
                            style: const TextStyle(fontSize: 38)),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(type['title']!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF333333))),
                              if (type['subtitle'] != null)
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(type['subtitle']!,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF666666))),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
