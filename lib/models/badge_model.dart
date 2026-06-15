import 'package:flutter/material.dart';

/// 徽章 ID 枚举（按类别分组，类别内相邻）
enum BadgeId {
  // ── 类别1: 词语 ──
  word10,   // 掌握10词
  word50,   // 掌握50词
  word100,  // 掌握100词
  word500,   // 掌握500词
  word1000,  // 掌握1000词
  word3000,  // 掌握3000词

  // ── 类别2: 成语 ──
  idiom10,   // 掌握10个成语
  idiom50,   // 掌握50个成语
  idiom100,  // 掌握100个成语
  idiom500,  // 掌握500个成语

  // ── 类别3: 谚语 ──
  proverb10,  // 掌握10个谚语
  proverb30,  // 掌握30个谚语
  proverb50,  // 掌握50个谚语
  proverb100, // 掌握100个谚语

  // ── 类别4: 诗词 ──
  poem5,     // 学习5首诗词
  poem10,    // 学习10首诗词
  poem50,    // 学习50首诗词
  poem100,   // 学习100首诗词

  // ── 类别5: 收藏 ──
  fav10,     // 收藏10个
  fav50,     // 收藏50个
  fav100,    // 收藏100个
  fav500,    // 收藏500个
  fav1000,   // 收藏1000个
  fav3000,   // 收藏3000个

  // ── 类别6: 连续学习 ──
  streak3,   // 坚持不懈
  streak7,   // 一周勇士
  streak14,  // 双周达人
  streak30,  // 月度冠军

  // ── 类别7: 累计学习天数 ──
  totalDays3,   // 累计学习3天
  totalDays7,   // 累计学习7天
  totalDays15,  // 累计学习15天
  totalDays30,  // 累计学习30天
  totalDays100, // 累计学习100天
  totalDays365, // 累计学习365天
}

/// 徽章定义（不含动态数据，纯静态配置）
class BadgeDef {
  final BadgeId id;
  final String titleKey;   // l10n key
  final String descKey;    // l10n key
  final IconData icon;
  final Color color;

  const BadgeDef({
    required this.id,
    required this.titleKey,
    required this.descKey,
    required this.icon,
    required this.color,
  });

  /// 全部徽章定义（顺序即为展示顺序）
  static const List<BadgeDef> all = [
    // ── 类别1: 词语 ──
    BadgeDef(
      id: BadgeId.word10,
      titleKey: 'badgeWord10',
      descKey: 'badgeWord10Desc',
      icon: Icons.looks_one_rounded,
      color: Color(0xFF81D4FA),
    ),
    BadgeDef(
      id: BadgeId.word50,
      titleKey: 'badgeWord50',
      descKey: 'badgeWord50Desc',
      icon: Icons.looks_two_rounded,
      color: Color(0xFF4FC3F7),
    ),
    BadgeDef(
      id: BadgeId.word100,
      titleKey: 'badgeWord100',
      descKey: 'badgeWord100Desc',
      icon: Icons.looks_3_rounded,
      color: Color(0xFF29B6F6),
    ),
    BadgeDef(
      id: BadgeId.word500,
      titleKey: 'badgeWord500',
      descKey: 'badgeWord500Desc',
      icon: Icons.auto_stories_rounded,
      color: Color(0xFF10B981),
    ),
    BadgeDef(
      id: BadgeId.word1000,
      titleKey: 'badgeWord1000',
      descKey: 'badgeWord1000Desc',
      icon: Icons.shield_rounded,
      color: Color(0xFF1E88E5),
    ),
    BadgeDef(
      id: BadgeId.word3000,
      titleKey: 'badgeWord3000',
      descKey: 'badgeWord3000Desc',
      icon: Icons.diamond_rounded,
      color: Color(0xFFE91E63),
    ),

    // ── 类别2: 成语 ──
    BadgeDef(
      id: BadgeId.idiom10,
      titleKey: 'badgeIdiom10',
      descKey: 'badgeIdiom10Desc',
      icon: Icons.lightbulb_outline_rounded,
      color: Colors.orange,
    ),
    BadgeDef(
      id: BadgeId.idiom50,
      titleKey: 'badgeIdiom50',
      descKey: 'badgeIdiom50Desc',
      icon: Icons.emoji_objects_rounded,
      color: Color(0xFFFF8F00),
    ),
    BadgeDef(
      id: BadgeId.idiom100,
      titleKey: 'badgeIdiom100',
      descKey: 'badgeIdiom100Desc',
      icon: Icons.auto_awesome_rounded,
      color: Color(0xFFD84315),
    ),
    BadgeDef(
      id: BadgeId.idiom500,
      titleKey: 'badgeIdiom500',
      descKey: 'badgeIdiom500Desc',
      icon: Icons.military_tech_rounded,
      color: Color(0xFF6A1B9A),
    ),

    // ── 类别3: 谚语 ──
    BadgeDef(
      id: BadgeId.proverb10,
      titleKey: 'badgeProverb10',
      descKey: 'badgeProverb10Desc',
      icon: Icons.format_quote_rounded,
      color: Color(0xFF00796B),
    ),
    BadgeDef(
      id: BadgeId.proverb30,
      titleKey: 'badgeProverb30',
      descKey: 'badgeProverb30Desc',
      icon: Icons.menu_book_rounded,
      color: Color(0xFF388E3C),
    ),
    BadgeDef(
      id: BadgeId.proverb50,
      titleKey: 'badgeProverb50',
      descKey: 'badgeProverb50Desc',
      icon: Icons.school_rounded,
      color: Color(0xFF1B5E20),
    ),
    BadgeDef(
      id: BadgeId.proverb100,
      titleKey: 'badgeProverb100',
      descKey: 'badgeProverb100Desc',
      icon: Icons.emoji_events_rounded,
      color: Color(0xFFC2185B),
    ),

    // ── 类别4: 诗词 ──
    BadgeDef(
      id: BadgeId.poem5,
      titleKey: 'badgePoem5',
      descKey: 'badgePoem5Desc',
      icon: Icons.nightlight_round,
      color: Color(0xFF5C6BC0),
    ),
    BadgeDef(
      id: BadgeId.poem10,
      titleKey: 'badgePoem10',
      descKey: 'badgePoem10Desc',
      icon: Icons.auto_fix_high_rounded,
      color: Color(0xFF303F9F),
    ),
    BadgeDef(
      id: BadgeId.poem50,
      titleKey: 'badgePoem50',
      descKey: 'badgePoem50Desc',
      icon: Icons.star_rounded,
      color: Color(0xFFFFB300),
    ),
    BadgeDef(
      id: BadgeId.poem100,
      titleKey: 'badgePoem100',
      descKey: 'badgePoem100Desc',
      icon: Icons.diamond_rounded,
      color: Color(0xFFE91E63),
    ),

    // ── 类别5: 收藏 ──
    BadgeDef(
      id: BadgeId.fav10,
      titleKey: 'badgeFav10',
      descKey: 'badgeFav10Desc',
      icon: Icons.favorite_rounded,
      color: Color(0xFFE91E63),
    ),
    BadgeDef(
      id: BadgeId.fav50,
      titleKey: 'badgeFav50',
      descKey: 'badgeFav50Desc',
      icon: Icons.favorite_border_rounded,
      color: Color(0xFFFF4081),
    ),
    BadgeDef(
      id: BadgeId.fav100,
      titleKey: 'badgeFav100',
      descKey: 'badgeFav100Desc',
      icon: Icons.stars_rounded,
      color: Color(0xFFFF5722),
    ),
    BadgeDef(
      id: BadgeId.fav500,
      titleKey: 'badgeFav500',
      descKey: 'badgeFav500Desc',
      icon: Icons.workspace_premium_rounded,
      color: Color(0xFFFFD700),
    ),
    BadgeDef(
      id: BadgeId.fav1000,
      titleKey: 'badgeFav1000',
      descKey: 'badgeFav1000Desc',
      icon: Icons.emoji_events_rounded,
      color: Color(0xFF7B1FA2),
    ),
    BadgeDef(
      id: BadgeId.fav3000,
      titleKey: 'badgeFav3000',
      descKey: 'badgeFav3000Desc',
      icon: Icons.celebration_rounded,
      color: Color(0xFFC2185B),
    ),

    // ── 类别6: 连续学习 ──
    BadgeDef(
      id: BadgeId.streak3,
      titleKey: 'badgeStreak3',
      descKey: 'badgeStreak3Desc',
      icon: Icons.local_fire_department_rounded,
      color: Color(0xFFFF5722),
    ),
    BadgeDef(
      id: BadgeId.streak7,
      titleKey: 'badgeStreak7',
      descKey: 'badgeStreak7Desc',
      icon: Icons.whatshot_rounded,
      color: Color(0xFFD32F2F),
    ),
    BadgeDef(
      id: BadgeId.streak14,
      titleKey: 'badgeStreak14',
      descKey: 'badgeStreak14Desc',
      icon: Icons.celebration_rounded,
      color: Color(0xFFC2185B),
    ),
    BadgeDef(
      id: BadgeId.streak30,
      titleKey: 'badgeStreak30',
      descKey: 'badgeStreak30Desc',
      icon: Icons.emoji_events_rounded,
      color: Color(0xFF7B1FA2),
    ),

    // ── 类别7: 累计学习天数 ──
    BadgeDef(
      id: BadgeId.totalDays3,
      titleKey: 'badgeTotalDays3',
      descKey: 'badgeTotalDays3Desc',
      icon: Icons.calendar_today_rounded,
      color: Color(0xFF00BCD4),
    ),
    BadgeDef(
      id: BadgeId.totalDays7,
      titleKey: 'badgeTotalDays7',
      descKey: 'badgeTotalDays7Desc',
      icon: Icons.date_range_rounded,
      color: Color(0xFF03A9F4),
    ),
    BadgeDef(
      id: BadgeId.totalDays15,
      titleKey: 'badgeTotalDays15',
      descKey: 'badgeTotalDays15Desc',
      icon: Icons.event_rounded,
      color: Color(0xFF10B981),
    ),
    BadgeDef(
      id: BadgeId.totalDays30,
      titleKey: 'badgeTotalDays30',
      descKey: 'badgeTotalDays30Desc',
      icon: Icons.event_available_rounded,
      color: Color(0xFF1E88E5),
    ),
    BadgeDef(
      id: BadgeId.totalDays100,
      titleKey: 'badgeTotalDays100',
      descKey: 'badgeTotalDays100Desc',
      icon: Icons.workspace_premium_rounded,
      color: Color(0xFFFFB300),
    ),
    BadgeDef(
      id: BadgeId.totalDays365,
      titleKey: 'badgeTotalDays365',
      descKey: 'badgeTotalDays365Desc',
      icon: Icons.military_tech_rounded,
      color: Color(0xFFFFD700),
    ),
  ];

  /// 根据 id 查找定义
  static BadgeDef? find(BadgeId id) {
    try {
      return all.firstWhere((b) => b.id == id);
    } catch (_) {
      return null;
    }
  }
}
