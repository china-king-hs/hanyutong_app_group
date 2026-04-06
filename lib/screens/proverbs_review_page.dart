import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';
import '../l10n/app_localizations.dart';
import '../models/proverb_model.dart';
import '../models/proverb_repository.dart';
import '../widgets/sound_wave_button.dart';

/// 谚语复习页 — 显示已掌握的谚语（无难度栏），支持查看中文释义和收藏
class ProverbsReviewPage extends StatefulWidget {
  const ProverbsReviewPage({super.key});

  @override
  State<ProverbsReviewPage> createState() => _ProverbsReviewPageState();
}

class _ProverbsReviewPageState extends State<ProverbsReviewPage> {
  bool _isLoading = true;
  String? _loadError;

  /// 进入页面时的已掌握谚语快照（不随实时 toggle 变化，退出重进才刷新）
  List<ProverbModel> _snapshotProverbs = [];

  @override
  void initState() {
    super.initState();
    _loadProverbs();
  }

  Future<void> _loadProverbs() async {
    try {
      final state = context.read<AppState>();
      final proverbs = await ProverbRepository.loadProverbs();
      if (mounted) {
        setState(() {
          _snapshotProverbs = _buildSnapshot(proverbs, state);
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _loadError = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  /// 根据掌握顺序倒序构建快照（最新掌握排最上面）
  List<ProverbModel> _buildSnapshot(List<ProverbModel> allProverbs, AppState state) {
    final ids = state.masteredProverbIds.toList(); // Set → List
    final proverbMap = {for (final p in allProverbs) p.id: p};
    return ids
        .where((id) => proverbMap.containsKey(id))
        .map((id) => proverbMap[id]!)
        .toList()
        .reversed
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final loc = AppLocalizations.of(context)!;
    final masteredProverbs = _isLoading ? <ProverbModel>[] : _snapshotProverbs;
    final masteredCount = _isLoading ? 0 : masteredProverbs.length;

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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Color(0xFFE0E0E0))),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(Icons.arrow_back,
                          color: Color(0xFF333333)),
                    ),
                    Text(loc.proverbsReview,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ),

          // Subtitle — 已掌握数量
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
            child: Text(
              '$masteredCount ${loc.mastered}',
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF666666),
              ),
            ),
          ),

          // Content
          Expanded(
            child: _isLoading
                ? const Center(
                    child:
                        CircularProgressIndicator(color: Color(0xFF4285F4)))
                : _loadError != null
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.error_outline,
                                color: Colors.red, size: 48),
                            const SizedBox(height: 12),
                            Text(loc.dataNotLoaded,
                                style: const TextStyle(
                                    color: Color(0xFF666666))),
                          ],
                        ),
                      )
                    : masteredProverbs.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.check_circle_outline,
                                    size: 64, color: Color(0xFFCCCCCC)),
                                const SizedBox(height: 16),
                                Text(loc.noMasteredWordsYet,
                                    style: const TextStyle(
                                        fontSize: 16, color: Color(0xFF999999))),
                                const SizedBox(height: 8),
                                Text(loc.noMasteredWordsHint,
                                    style: const TextStyle(
                                        fontSize: 13, color: Color(0xFFBBBBBB)),
                                    textAlign: TextAlign.center),
                              ],
                            ),
                          )
                        : ListView.separated(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            itemCount: masteredProverbs.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: 8),
                            itemBuilder: (_, i) {
                              final proverb = masteredProverbs[i];
                              return _ProverbReviewCard(
                                proverb: proverb,
                                languageCode: state.language,
                                isFavorite: state.favorites
                                    .contains(proverb.id),
                                onToggleFavorite: () =>
                                    state.toggleFavorite(proverb.id),
                              );
                            },
                          ),
          ),
        ],
      ),
    );
  }
}

/// 单个谚语复习卡片：中文+拼音 | 翻译 | 播放 | 中文释义按钮 | 星形收藏按钮
class _ProverbReviewCard extends StatelessWidget {
  final ProverbModel proverb;
  final String languageCode;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;

  const _ProverbReviewCard({
    required this.proverb,
    required this.languageCode,
    required this.isFavorite,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 第一行：中文+拼音 | 翻译 | 播放 | 收藏
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 中文 + 拼音
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      proverb.sentence,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF333333),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      proverb.pinyin,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF999999),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              // 翻译
              Expanded(
                flex: 4,
                child: Text(
                  proverb.translationFor(languageCode),
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF4285F4),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              // 播放按钮
              SoundWaveButton(size: 26, text: proverb.sentence),
              // 星形收藏按钮
              GestureDetector(
                onTap: onToggleFavorite,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Icon(
                    isFavorite ? Icons.star : Icons.star_border,
                    color: isFavorite ? Colors.amber : Colors.grey,
                    size: 22,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // 第二行：查看中文释义按钮
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => _showExplanation(context),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.menu_book,
                        size: 14, color: Color(0xFF666666)),
                    const SizedBox(width: 4),
                    Text(
                      AppLocalizations.of(context)!.chineseExplanation,
                      style: const TextStyle(
                          fontSize: 12, color: Color(0xFF666666)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 显示中文释义对话框
  void _showExplanation(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(loc.chineseExplanation,
            style:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        content: Text(proverb.explanation,
            style: const TextStyle(color: Color(0xFF666666), fontSize: 15)),
        actions: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(ctx),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE0E0E0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(loc.close,
                  style: const TextStyle(color: Color(0xFF666666))),
            ),
          ),
        ],
      ),
    );
  }
}
