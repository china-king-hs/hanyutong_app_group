import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';
import '../l10n/app_localizations.dart';

// 获取本地化的级别列表
List<Map<String, String>> _getLevels(BuildContext context) {
  final localizations = AppLocalizations.of(context);
  return [
    {'id': 'beginner', 'name': localizations!.beginnerLevel},
    {'id': 'elementary', 'name': localizations.elementaryLevel},
    {'id': 'intermediate', 'name': localizations.intermediateLevel},
    {'id': 'advanced', 'name': localizations.advancedLevelName},
  ];
}

class LearnTab extends StatefulWidget {
  const LearnTab({super.key});

  @override
  State<LearnTab> createState() => _LearnTabState();
}

class _LearnTabState extends State<LearnTab> {
  bool _showLevelSelector = false;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final levels = _getLevels(context);
    final currentLevel =
        levels.firstWhere((l) => l['id'] == state.level, orElse: () => levels[0]);

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 基础学习标题
            Text(AppLocalizations.of(context)!.basicLearning,
                style: const TextStyle(fontSize: 13, color: Color(0xFF999999))),
            const SizedBox(height: 12),
            // Level Selector
            GestureDetector(
              onTap: () => setState(() => _showLevelSelector = !_showLevelSelector),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withValues(alpha: 0.06),
                        blurRadius: 4,
                        offset: const Offset(0, 2))
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(currentLevel['name']!,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Icon(_showLevelSelector
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down),
                  ],
                ),
              ),
            ),
            if (_showLevelSelector) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2))
                  ],
                ),
                child: Column(
                  children: levels
                      .map((lvl) => GestureDetector(
                            onTap: () {
                              state.setLevel(lvl['id']!);
                              setState(() => _showLevelSelector = false);
                            },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              margin: const EdgeInsets.only(bottom: 8),
                              decoration: BoxDecoration(
                                color: state.level == lvl['id']
                                    ? const Color(0xFF4285F4)
                                    : const Color(0xFFF5F5F5),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                lvl['name']!,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: state.level == lvl['id']
                                      ? Colors.white
                                      : const Color(0xFF333333),
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ],
            const SizedBox(height: 16),

            // Practice Buttons — 左右并排
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _PracticeCard(
                    emoji: '📖',
                    label: AppLocalizations.of(context)!.wordsPractice,
                    color: const Color(0xFFDCEAFF),
                    iconColor: const Color(0xFF4285F4),
                    icon: Icons.menu_book,
                    onTap: () => context.push('/practice/words'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _PracticeCard(
                    emoji: '📐',
                    label: AppLocalizations.of(context)!.grammarLearning,
                    color: const Color(0xFFFFEDD8),
                    iconColor: Colors.orange,
                    icon: Icons.translate,
                    onTap: () => context.push('/grammar'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Advanced Reading
            Text(AppLocalizations.of(context)!.advancedReading,
                style: const TextStyle(fontSize: 13, color: Color(0xFF999999))),
            const SizedBox(height: 12),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _SimpleCard(emoji: '🀄', label: AppLocalizations.of(context)!.idioms,
                    onTap: () => context.push('/advanced/idioms')),
                _SimpleCard(emoji: '📜', label: AppLocalizations.of(context)!.proverbs,
                    onTap: () => context.push('/advanced/proverbs')),
                _SimpleCard(emoji: '🎋', label: AppLocalizations.of(context)!.poetry,
                    onTap: () => context.push('/advanced/poetry')),
                _SimpleCard(emoji: '🏮', label: AppLocalizations.of(context)!.culture,
                    onTap: () => context.push('/culture')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PracticeCard extends StatelessWidget {
  final String emoji;
  final String label;
  final Color color;
  final Color iconColor;
  final IconData icon;
  final VoidCallback onTap;

  const _PracticeCard({
    required this.emoji,
    required this.label,
    required this.color,
    required this.iconColor,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(12)),
              child: Icon(icon, color: iconColor, size: 22),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 40,
              child: Text(
                label,
                maxLines: 2,
                softWrap: true,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xFF333333)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SimpleCard extends StatelessWidget {
  final String emoji;
  final String label;
  final VoidCallback onTap;

  const _SimpleCard(
      {required this.emoji, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 36)),
            const SizedBox(height: 8),
            Text(label,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xFF333333))),
          ],
        ),
      ),
    );
  }
}
