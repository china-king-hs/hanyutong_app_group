import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';
import '../l10n/app_localizations.dart';
import '../models/word_model.dart';
import '../models/word_repository.dart';
import '../widgets/sound_wave_button.dart';

/// 词语复习页 — 显示所有难度下已掌握的词语，支持按难度筛选
class WordsReviewPage extends StatefulWidget {
  const WordsReviewPage({super.key});

  @override
  State<WordsReviewPage> createState() => _WordsReviewPageState();
}

class _WordsReviewPageState extends State<WordsReviewPage> {
  String _selectedLevel = 'beginner';
  bool _isLoading = true;
  String? _loadError;
  // 每个难度缓存全部词语
  final Map<String, List<WordModel>> _wordsCache = {};
  static const _allLevels = ['beginner', 'elementary', 'intermediate', 'advanced'];

  @override
  void initState() {
    super.initState();
    _loadAllLevels();
  }

  Future<void> _loadAllLevels() async {
    // 并行加载四个难度的词语
    final futures = _allLevels.map((level) => WordRepository.loadWords(level));
    try {
      final results = await Future.wait(futures);
      if (mounted) {
        setState(() {
          for (int i = 0; i < _allLevels.length; i++) {
            _wordsCache[_allLevels[i]] = results[i];
          }
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

  /// 根据选中的难度 + AppState 的 masteredWordIds 实时过滤
  /// masteredWordIds 是有序 List（越后面的越新掌握），倒序后最新掌握的排最上面
  List<WordModel> _filterMastered(AppState state) {
    final words = _wordsCache[_selectedLevel];
    if (words == null) return [];
    final ids = state.masteredWordIds; // List<String>，保留掌握顺序
    // 按 ids 中的先后顺序排列，然后反转（新的排最上）
    final wordMap = {for (final w in words) w.id: w};
    return ids
        .where((id) => wordMap.containsKey(id))
        .map((id) => wordMap[id]!)
        .toList()
        .reversed
        .toList();
  }

  /// 当前选中难度下的已掌握词语数量
  int _masteredCount(AppState state) {
    final words = _wordsCache[_selectedLevel];
    if (words == null) return 0;
    return words.where((w) => state.masteredWordIds.contains(w.id)).length;
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final loc = AppLocalizations.of(context)!;
    final masteredWords = _isLoading ? <WordModel>[] : _filterMastered(state);
    final masteredCount = _isLoading ? 0 : _masteredCount(state);

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
                  border: Border(bottom: BorderSide(color: Color(0xFFE0E0E0))),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(Icons.arrow_back, color: Color(0xFF333333)),
                    ),
                    Text(loc.wordsReview,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ),

          // 难度切换选项卡
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                _buildLevelTab(loc.beginnerLevel, 'beginner', state),
                const SizedBox(width: 8),
                _buildLevelTab(loc.elementaryLevel, 'elementary', state),
                const SizedBox(width: 8),
                _buildLevelTab(loc.intermediateLevel, 'intermediate', state),
                const SizedBox(width: 8),
                _buildLevelTab(loc.advancedLevelName, 'advanced', state),
              ],
            ),
          ),

          // Subtitle
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
                ? const Center(child: CircularProgressIndicator(color: Color(0xFF10B981)))
                : _loadError != null
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.error_outline, color: Colors.red, size: 48),
                            const SizedBox(height: 12),
                            Text(loc.dataNotLoaded,
                                style: const TextStyle(color: Color(0xFF666666))),
                          ],
                        ),
                      )
                    : masteredWords.isEmpty
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
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            itemCount: masteredWords.length,
                            separatorBuilder: (_, __) => const SizedBox(height: 8),
                            itemBuilder: (_, i) {
                              final word = masteredWords[i];
                              return _WordReviewCard(
                                word: word,
                                languageCode: state.language,
                                isFavorite: state.favorites.contains(word.id),
                                onToggleFavorite: () => state.toggleFavorite(word.id),
                              );
                            },
                          ),
          ),
        ],
      ),
    );
  }

  /// 构建单个难度选项卡按钮
  Widget _buildLevelTab(String label, String level, AppState state) {
    final isSelected = _selectedLevel == level;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedLevel = level),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF10B981) : const Color(0xFFF0F0F0),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? Colors.white : const Color(0xFF666666),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// 单个词语复习卡片：中文 + 拼音 + 翻译 + 播放 + 收藏
class _WordReviewCard extends StatelessWidget {
  final WordModel word;
  final String languageCode;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;

  const _WordReviewCard({
    required this.word,
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 中文 + 拼音
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  word.word,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  word.pinyin,
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
              word.translationFor(languageCode),
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF10B981),
              ),
            ),
          ),
          const SizedBox(width: 6),
          SoundWaveButton(size: 26, text: word.word),
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
    );
  }
}
