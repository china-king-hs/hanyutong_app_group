import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';
import '../l10n/app_localizations.dart';

const _langFlags = {
  'en': '🇺🇸', 'es': '🇪🇸', 'fr': '🇫🇷', 'de': '🇩🇪',
  'ja': '🇯🇵', 'ko': '🇰🇷',
};

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final loc = AppLocalizations.of(context)!;

    final progress = [
      {'label': '📝 ${loc.wordsLabel}', 'value': 45, 'color': const Color(0xFF4285F4)},
      {'label': '📄 ${loc.sentencesLabel}', 'value': 30, 'color': Colors.green},
      {'label': '📐 Grammar', 'value': 0, 'color': Colors.grey, 'locked': true},
      {'label': '🎧 ${loc.listening}', 'value': 20, 'color': Colors.purple},
      {'label': '⭐ ${loc.advancedLabel}', 'value': 10, 'color': Colors.red},
    ];

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            Row(
              children: [
                Container(
                  width: 72,
                  height: 72,
                  decoration: const BoxDecoration(
                    color: Color(0xFF4285F4),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.person, color: Colors.white, size: 40),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(loc.learnerName,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF333333))),
                      const SizedBox(height: 4),
                      Text(
                        _langFlags[state.language] ?? '🇺🇸',
                        style: const TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => context.push('/empty'),
                  icon: const Icon(Icons.notifications_outlined,
                      color: Color(0xFF666666)),
                ),
                IconButton(
                  onPressed: () => context.push('/empty'),
                  icon: const Icon(Icons.settings_outlined,
                      color: Color(0xFF666666)),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Achievements
            Text(loc.myAchievements,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333))),
            const SizedBox(height: 16),
            SizedBox(
              height: 80,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                separatorBuilder: (_, __) => const SizedBox(width: 16),
                itemBuilder: (_, __) => Container(
                  width: 72,
                  height: 72,
                  decoration: const BoxDecoration(
                      color: Color(0xFFE0E0E0), shape: BoxShape.circle),
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Learning Progress
            Text(loc.learningProgress,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333))),
            const SizedBox(height: 16),
            ...progress.map((item) {
              final isLocked = item['locked'] == true;
              final val = item['value'] as int;
              final color = item['color'] as Color;
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(item['label'] as String,
                            style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF666666))),
                        isLocked
                            ? const Text('🔒',
                                style: TextStyle(
                                    fontSize: 13, color: Color(0xFF999999)))
                            : Text('$val%',
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF4285F4))),
                      ],
                    ),
                    const SizedBox(height: 6),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: val / 100.0,
                        backgroundColor: const Color(0xFFE0E0E0),
                        color: isLocked ? Colors.grey[300] : color,
                        minHeight: 8,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
