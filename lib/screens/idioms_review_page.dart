import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';
import '../l10n/app_localizations.dart';
import '../models/idiom_model.dart';
import '../models/idiom_repository.dart';
import '../widgets/sound_wave_button.dart';

/// 成语复习页 — 显示已掌握的成语（无难度栏），支持查看中文释义和收藏
class IdiomsReviewPage extends StatefulWidget {
  const IdiomsReviewPage({super.key});

  @override
  State<IdiomsReviewPage> createState() => _IdiomsReviewPageState();
}

class _IdiomsReviewPageState extends State<IdiomsReviewPage> {
  bool _isLoading = true;
  String? _loadError;

  /// 进入页面时的已掌握成语快照（不随实时 toggle 变化，退出重进才刷新）
  List<IdiomModel> _snapshotIdioms = [];

  @override
  void initState() {
    super.initState();
    _loadIdioms();
  }

  Future<void> _loadIdioms() async {
    try {
      final state = context.read<AppState>();
      final idioms = await IdiomRepository.loadIdioms();
      if (mounted) {
        setState(() {
          _snapshotIdioms = _buildSnapshot(idioms, state);
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
  List<IdiomModel> _buildSnapshot(List<IdiomModel> allIdioms, AppState state) {
    final ids = state.masteredIdiomIds; // List<String>
    final idiomMap = {for (final i in allIdioms) i.id: i};
    return ids
        .where((id) => idiomMap.containsKey(id))
        .map((id) => idiomMap[id]!)
        .toList()
        .reversed
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final loc = AppLocalizations.of(context)!;
    final masteredIdioms = _isLoading ? <IdiomModel>[] : _snapshotIdioms;
    final masteredCount = _isLoading ? 0 : masteredIdioms.length;

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
                    Text(loc.idiomsReview,
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
                    : masteredIdioms.isEmpty
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
                            itemCount: masteredIdioms.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: 8),
                            itemBuilder: (_, i) {
                              final idiom = masteredIdioms[i];
                              return _IdiomReviewCard(
                                idiom: idiom,
                                languageCode: state.language,
                                isFavorite: state.favorites
                                    .contains(idiom.id),
                                onToggleFavorite: () =>
                                    state.toggleFavorite(idiom.id),
                              );
                            },
                          ),
          ),
        ],
      ),
    );
  }
}

/// 单个成语复习卡片：中文+拼音 | 翻译 | 播放 | 中文释义按钮 | 星形收藏按钮
class _IdiomReviewCard extends StatelessWidget {
  final IdiomModel idiom;
  final String languageCode;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;

  const _IdiomReviewCard({
    required this.idiom,
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
                      idiom.word,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF333333),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      idiom.pinyin,
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
                  idiom.translationFor(languageCode),
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF4285F4),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              // 播放按钮
              const SoundWaveButton(size: 26),
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
        content: Text(idiom.explanation,
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
