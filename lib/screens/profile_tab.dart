import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';
import '../l10n/app_localizations.dart';
import '../models/word_repository.dart';
import '../models/idiom_repository.dart';
import '../models/proverb_repository.dart';
import '../models/poetry_repository.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  // 各类型总数据量
  int _totalWords = 0;
  int _totalIdioms = 0;
  int _totalProverbs = 0;
  int _totalPoems = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTotals();
  }

  Future<void> _loadTotals() async {
    final state = context.read<AppState>();
    // 根据用户当前难度加载对应的词语总数
    final words = await WordRepository.loadWords(state.level);
    // 成语、谚语、诗词加载全部
    final idioms = await IdiomRepository.loadIdioms();
    final proverbs = await ProverbRepository.loadProverbs();
    final poems = await PoetryRepository.loadPoetry();

    if (mounted) {
      setState(() {
        _totalWords = words.length;
        _totalIdioms = idioms.length;
        _totalProverbs = proverbs.length;
        _totalPoems = poems.length;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final loc = AppLocalizations.of(context)!;

    // 计算各类型百分比
    final wordsPercent = _totalWords > 0 ? (state.masteredWords / _totalWords * 100).round() : 0;
    final idiomsPercent = _totalIdioms > 0 ? (state.masteredIdioms / _totalIdioms * 100).round() : 0;
    final proverbsPercent = _totalProverbs > 0 ? (state.masteredProverbs / _totalProverbs * 100).round() : 0;
    final poemsPercent = _totalPoems > 0 ? (state.learnedPoems / _totalPoems * 100).round() : 0;

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
                      Text(state.username,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF333333))),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => context.push('/notifications'),
                  icon: const Icon(Icons.notifications_outlined,
                      color: Color(0xFF666666)),
                ),
                IconButton(
                  onPressed: () => context.push('/settings'),
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
            _isLoading
                ? const Padding(
                    padding: EdgeInsets.symmetric(vertical: 32),
                    child: Center(
                      child: CircularProgressIndicator(color: Color(0xFF4285F4)),
                    ),
                  )
                : Column(
                    children: [
                      _buildProgressBar('📝 ${loc.wordsLabel}', wordsPercent, const Color(0xFF4285F4)),
                      _buildProgressBar('🀄 ${loc.idioms}', idiomsPercent, Colors.orange),
                      _buildProgressBar('📜 ${loc.proverbs}', proverbsPercent, Colors.green),
                      _buildProgressBar('🎋 ${loc.poetry}', poemsPercent, Colors.purple),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar(String label, int percent, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label,
                  style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF666666))),
              Text('$percent%',
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
              value: percent / 100.0,
              backgroundColor: const Color(0xFFE0E0E0),
              color: color,
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }
}
