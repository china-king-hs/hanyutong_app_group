import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';
import '../l10n/app_localizations.dart';
import '../models/word_repository.dart';
import '../models/idiom_repository.dart';
import '../models/proverb_repository.dart';
import '../models/poetry_repository.dart';
import '../models/badge_model.dart';

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
    // 加载所有难度的词语总数
    final wordsBeginner = await WordRepository.loadWords('beginner');
    final wordsElementary = await WordRepository.loadWords('elementary');
    final wordsIntermediate = await WordRepository.loadWords('intermediate');
    final wordsAdvanced = await WordRepository.loadWords('advanced');
    final totalWordsCount = wordsBeginner.length +
        wordsElementary.length +
        wordsIntermediate.length +
        wordsAdvanced.length;
    // 成语、谚语、诗词加载全部
    final idioms = await IdiomRepository.loadIdioms();
    final proverbs = await ProverbRepository.loadProverbs();
    final poems = await PoetryRepository.loadPoetry();

    if (mounted) {
      setState(() {
        _totalWords = totalWordsCount;
        _totalIdioms = idioms.length;
        _totalProverbs = proverbs.length;
        _totalPoems = poems.length;
        _isLoading = false;
      });
      // 检查并解锁徽章
      state.checkAndUnlockBadges(totalWords: totalWordsCount);
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
                    color: Color(0xFF10B981),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(loc.myAchievements,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF333333))),
                TextButton(
                  onPressed: () => context.push('/achievements'),
                  child: Text(
                    loc.viewAll,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF10B981),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // 最新4个成就横向展示
            _buildLatestBadges(state),
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
                      child: CircularProgressIndicator(color: Color(0xFF10B981)),
                    ),
                  )
                : Column(
                    children: [
                      _buildProgressBar('📝 ${loc.wordsLabel}', wordsPercent, const Color(0xFF10B981)),
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

  // ---------- 成就组件 ----------

  /// 构建最新成就展示（最多3个）
  Widget _buildLatestBadges(AppState state) {
    final loc = AppLocalizations.of(context)!;
    final latestBadges = state.getLatestUnlockedBadges(3);

    if (latestBadges.isEmpty) {
      // 无成就时显示提示
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Center(
          child: Text(
            loc.startLearningToUnlockAchievements,
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 14,
            ),
          ),
        ),
      );
    }

    return SizedBox(
      height: 110,
      child: Row(
        children: [
          for (int i = 0; i < latestBadges.length; i++) ...[
            Expanded(
              child: _buildMiniBadgeCard(
                badgeId: latestBadges[i],
                state: state,
              ),
            ),
            if (i < latestBadges.length - 1) const SizedBox(width: 8),
          ],
        ],
      ),
    );
  }

  /// 小型成就卡片
  Widget _buildMiniBadgeCard({
    required String badgeId,
    required AppState state,
  }) {
    final badge = BadgeDef.all.firstWhere(
      (b) => b.id.name == badgeId,
      orElse: () => BadgeDef.all.first,
    );
    final unlocked = state.unlockedBadgeIds.contains(badgeId);

    return GestureDetector(
      onTap: () => _showBadgeDialog(context, badge, unlocked),
      child: Card(
        elevation: unlocked ? 3 : 0.5,
        shadowColor: unlocked ? badge.color.withValues(alpha: 0.3) : Colors.grey.shade200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: unlocked ? badge.color.withValues(alpha: 0.3) : const Color(0xFFE0E0E0),
            width: 1,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: unlocked
                ? badge.color.withValues(alpha: 0.05)
                : const Color(0xFFFAFAFA),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: unlocked
                      ? badge.color.withValues(alpha: 0.15)
                      : const Color(0xFFF0F0F0),
                ),
                child: Icon(
                  badge.icon,
                  size: 22,
                  color: unlocked ? badge.color : const Color(0xFFBDBDBD),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                _getBadgeTitle(badgeId),
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: unlocked ? const Color(0xFF333333) : const Color(0xFFAAAAAA),
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 获取徽章标题（根据 badge id）
  String _getBadgeTitle(String badgeId) {
    final loc = AppLocalizations.of(context)!;
    switch (badgeId) {
      case 'word10':       return loc.badgeWord10;
      case 'word50':       return loc.badgeWord50;
      case 'word100':      return loc.badgeWord100;
      case 'word500':      return loc.badgeWord500;
      case 'word1000':     return loc.badgeWord1000;
      case 'word3000':     return loc.badgeWord3000;
      case 'idiom10':      return loc.badgeIdiom10;
      case 'idiom50':      return loc.badgeIdiom50;
      case 'idiom100':     return loc.badgeIdiom100;
      case 'idiom500':     return loc.badgeIdiom500;
      case 'proverb10':    return loc.badgeProverb10;
      case 'proverb30':    return loc.badgeProverb30;
      case 'proverb50':    return loc.badgeProverb50;
      case 'proverb100':   return loc.badgeProverb100;
      case 'poem5':        return loc.badgePoem5;
      case 'poem10':       return loc.badgePoem10;
      case 'poem50':       return loc.badgePoem50;
      case 'poem100':      return loc.badgePoem100;
      case 'fav10':        return loc.badgeFav10;
      case 'fav50':        return loc.badgeFav50;
      case 'fav100':       return loc.badgeFav100;
      case 'fav500':       return loc.badgeFav500;
      case 'fav1000':      return loc.badgeFav1000;
      case 'fav3000':      return loc.badgeFav3000;
      case 'streak3':      return loc.badgeStreak3;
      case 'streak7':      return loc.badgeStreak7;
      case 'streak14':     return loc.badgeStreak14;
      case 'streak30':     return loc.badgeStreak30;
      case 'totalDays3':   return loc.badgeTotalDays3;
      case 'totalDays7':   return loc.badgeTotalDays7;
      case 'totalDays15':  return loc.badgeTotalDays15;
      case 'totalDays30':  return loc.badgeTotalDays30;
      case 'totalDays100': return loc.badgeTotalDays100;
      case 'totalDays365': return loc.badgeTotalDays365;
      default:             return badgeId;
    }
  }

  /// 获取徽章描述
  String _getBadgeDesc(String badgeId) {
    final loc = AppLocalizations.of(context)!;
    switch (badgeId) {
      case 'word10':       return loc.badgeWord10Desc;
      case 'word50':       return loc.badgeWord50Desc;
      case 'word100':      return loc.badgeWord100Desc;
      case 'word500':      return loc.badgeWord500Desc;
      case 'word1000':     return loc.badgeWord1000Desc;
      case 'word3000':     return loc.badgeWord3000Desc;
      case 'idiom10':      return loc.badgeIdiom10Desc;
      case 'idiom50':      return loc.badgeIdiom50Desc;
      case 'idiom100':     return loc.badgeIdiom100Desc;
      case 'idiom500':     return loc.badgeIdiom500Desc;
      case 'proverb10':    return loc.badgeProverb10Desc;
      case 'proverb30':    return loc.badgeProverb30Desc;
      case 'proverb50':    return loc.badgeProverb50Desc;
      case 'proverb100':   return loc.badgeProverb100Desc;
      case 'poem5':        return loc.badgePoem5Desc;
      case 'poem10':       return loc.badgePoem10Desc;
      case 'poem50':       return loc.badgePoem50Desc;
      case 'poem100':      return loc.badgePoem100Desc;
      case 'fav10':        return loc.badgeFav10Desc;
      case 'fav50':        return loc.badgeFav50Desc;
      case 'fav100':       return loc.badgeFav100Desc;
      case 'fav500':       return loc.badgeFav500Desc;
      case 'fav1000':      return loc.badgeFav1000Desc;
      case 'fav3000':      return loc.badgeFav3000Desc;
      case 'streak3':      return loc.badgeStreak3Desc;
      case 'streak7':      return loc.badgeStreak7Desc;
      case 'streak14':     return loc.badgeStreak14Desc;
      case 'streak30':     return loc.badgeStreak30Desc;
      case 'totalDays3':   return loc.badgeTotalDays3Desc;
      case 'totalDays7':   return loc.badgeTotalDays7Desc;
      case 'totalDays15':  return loc.badgeTotalDays15Desc;
      case 'totalDays30':  return loc.badgeTotalDays30Desc;
      case 'totalDays100': return loc.badgeTotalDays100Desc;
      case 'totalDays365': return loc.badgeTotalDays365Desc;
      default:             return '';
    }
  }

  /// 徽章详情弹窗
  void _showBadgeDialog(BuildContext context, BadgeDef badge, bool unlocked) {
    final loc = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 徽章图标
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: unlocked
                    ? badge.color.withValues(alpha: 0.15)
                    : const Color(0xFFF0F0F0),
                border: Border.all(
                  color: unlocked ? badge.color : const Color(0xFFD0D0D0),
                  width: 3,
                ),
              ),
              child: Icon(
                badge.icon,
                size: 40,
                color: unlocked ? badge.color : const Color(0xFFBDBDBD),
              ),
            ),
            const SizedBox(height: 16),
            // 徽章名称
            Text(
              _getBadgeTitle(badge.id.name),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: unlocked ? const Color(0xFF333333) : const Color(0xFF888888),
              ),
            ),
            const SizedBox(height: 8),
            // 徽章描述
            Text(
              _getBadgeDesc(badge.id.name),
              style: TextStyle(
                fontSize: 14,
                color: const Color(0xFF666666),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            // 解锁状态标签
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: unlocked
                    ? const Color(0xFF4CAF50).withValues(alpha: 0.1)
                    : const Color(0xFFE0E0E0),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                unlocked ? loc.badgeUnlocked : loc.badgeLocked,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: unlocked ? const Color(0xFF4CAF50) : const Color(0xFF888888),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('OK'),
          ),
        ],
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
                      color: Color(0xFF10B981))),
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
