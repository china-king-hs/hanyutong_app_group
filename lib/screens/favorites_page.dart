import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';
import '../l10n/app_localizations.dart';
import '../models/word_model.dart';
import '../models/word_repository.dart';
import '../models/idiom_model.dart';
import '../models/idiom_repository.dart';
import '../models/proverb_model.dart';
import '../models/proverb_repository.dart';
import '../models/poetry_model.dart';
import '../models/poetry_repository.dart';
import '../widgets/sound_wave_button.dart';

/// 收藏页 — 支持词语/成语/谚语/诗词四个分类
class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  String _selectedTab = 'words';
  bool _isLoading = true;
  String? _loadError;

  /// 进入页面时的收藏词语快照（不随实时 toggle 变化，退出重进才刷新）
  List<WordModel> _snapshotWords = [];

  /// 进入页面时的收藏成语快照
  List<IdiomModel> _snapshotIdioms = [];

  /// 进入页面时的收藏谚语快照
  List<ProverbModel> _snapshotProverbs = [];

  /// 进入页面时的收藏诗词快照
  List<PoetryModel> _snapshotPoems = [];

  @override
  void initState() {
    super.initState();
    _loadAllWords();
  }

  Future<void> _loadAllWords() async {
    // 并行加载四个难度的词语 + 全部成语 + 全部谚语 + 全部诗词
    final wordFutures = ['beginner', 'elementary', 'intermediate', 'advanced']
        .map((level) => WordRepository.loadWords(level));
    final idiomFuture = IdiomRepository.loadIdioms();
    final proverbFuture = ProverbRepository.loadProverbs();
    final poetryFuture = PoetryRepository.loadPoetry();
    try {
      final results = await Future.wait(wordFutures);
      final idioms = await idiomFuture;
      final proverbs = await proverbFuture;
      final poems = await poetryFuture;
      if (mounted) {
        // 加载完成后，用当前收藏状态生成快照
        final state = context.read<AppState>();
        final allWords = results.expand((list) => list).toList();
        setState(() {
          _snapshotWords = _buildSnapshot(allWords, state);
          _snapshotIdioms = _buildIdiomSnapshot(idioms, state);
          _snapshotProverbs = _buildProverbSnapshot(proverbs, state);
          _snapshotPoems = _buildPoetrySnapshot(poems, state);
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

  /// 根据收藏顺序倒序（最新收藏排最上面）构建快照，进入页面时调用一次
  List<WordModel> _buildSnapshot(List<WordModel> allWords, AppState state) {
    final ids = state.favoritesOrdered; // 有序 List
    final wordMap = {for (final w in allWords) w.id: w};
    return ids
        .where((id) => wordMap.containsKey(id))
        .map((id) => wordMap[id]!)
        .toList()
        .reversed
        .toList();
  }

  /// 构建成语收藏快照（按收藏顺序倒序，新的排最上面）
  List<IdiomModel> _buildIdiomSnapshot(List<IdiomModel> allIdioms, AppState state) {
    final ids = state.favoritesOrdered;
    final idiomMap = {for (final i in allIdioms) i.id: i};
    return ids
        .where((id) => idiomMap.containsKey(id))
        .map((id) => idiomMap[id]!)
        .toList()
        .reversed
        .toList();
  }

  /// 构建谚语收藏快照（按收藏顺序倒序，新的排最上面）
  List<ProverbModel> _buildProverbSnapshot(List<ProverbModel> allProverbs, AppState state) {
    final ids = state.favoritesOrdered;
    final proverbMap = {for (final p in allProverbs) p.id: p};
    return ids
        .where((id) => proverbMap.containsKey(id))
        .map((id) => proverbMap[id]!)
        .toList()
        .reversed
        .toList();
  }

  /// 构建诗词收藏快照（按收藏顺序倒序，新的排最上面）
  List<PoetryModel> _buildPoetrySnapshot(List<PoetryModel> allPoems, AppState state) {
    final ids = state.favoritesOrdered;
    final poemMap = {for (final p in allPoems) p.id: p};
    return ids
        .where((id) => poemMap.containsKey(id))
        .map((id) => poemMap[id]!)
        .toList()
        .reversed
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final loc = AppLocalizations.of(context)!;

    // 只有词语/成语/谚语/诗词选项卡有真实数据
    final showWordsContent = _selectedTab == 'words';
    final showIdiomsContent = _selectedTab == 'idioms';
    final showProverbsContent = _selectedTab == 'proverbs';
    final showPoetryContent = _selectedTab == 'poetry';
    // 使用进入页面时的快照（不因实时 toggle 而变化，退出重进才刷新）
    final favoriteWords = _isLoading ? <WordModel>[] : _snapshotWords;
    final favoriteIdioms = _isLoading ? <IdiomModel>[] : _snapshotIdioms;
    final favoriteProverbs = _isLoading ? <ProverbModel>[] : _snapshotProverbs;
    final favoritePoems = _isLoading ? <PoetryModel>[] : _snapshotPoems;
    final favoriteCount = _isLoading ? 0 : (showWordsContent ? favoriteWords.length : showIdiomsContent ? favoriteIdioms.length : showProverbsContent ? favoriteProverbs.length : showPoetryContent ? favoritePoems.length : 0);

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
                    Text(loc.myFavoritesTitle,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ),

          // 四个选项卡
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                _buildTab(loc.words, 'words'),
                const SizedBox(width: 8),
                _buildTab(loc.idioms, 'idioms'),
                const SizedBox(width: 8),
                _buildTab(loc.proverbs, 'proverbs'),
                const SizedBox(width: 8),
                _buildTab(loc.poetry, 'poetry'),
              ],
            ),
          ),

          // Subtitle — 收藏数量（词语、成语、谚语、诗词选项卡显示）
          if (showWordsContent || showIdiomsContent || showProverbsContent || showPoetryContent)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
              child: Text(
                '$favoriteCount ${loc.mastered}',
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
                        CircularProgressIndicator(color: Color(0xFF10B981)))
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
                    : showWordsContent
                        ? favoriteWords.isEmpty
                            ? _buildEmptyState(loc)
                            : ListView.separated(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                itemCount: favoriteWords.length,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(height: 8),
                                itemBuilder: (_, i) {
                                  final word = favoriteWords[i];
                                  return _FavoriteWordCard(
                                    word: word,
                                    languageCode: state.language,
                                    // 实时读取收藏状态，星星跟随点击变化
                                    isFavorite: state.favorites.contains(word.id),
                                    onToggleFavorite: () =>
                                        state.toggleFavorite(word.id),
                                  );
                                },
                              )
                        : showIdiomsContent
                            ? favoriteIdioms.isEmpty
                                ? _buildEmptyState(loc)
                                : ListView.separated(
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                    itemCount: favoriteIdioms.length,
                                    separatorBuilder: (_, __) =>
                                        const SizedBox(height: 8),
                                    itemBuilder: (_, i) {
                                      final idiom = favoriteIdioms[i];
                                      return _FavoriteIdiomCard(
                                        idiom: idiom,
                                        languageCode: state.language,
                                        isFavorite: state.favorites.contains(idiom.id),
                                        onToggleFavorite: () =>
                                            state.toggleFavorite(idiom.id),
                                      );
                                    },
                                  )
                            : showProverbsContent
                                ? favoriteProverbs.isEmpty
                                    ? _buildEmptyState(loc)
                                    : ListView.separated(
                                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                        itemCount: favoriteProverbs.length,
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(height: 8),
                                        itemBuilder: (_, i) {
                                          final proverb = favoriteProverbs[i];
                                          return _FavoriteProverbCard(
                                            proverb: proverb,
                                            languageCode: state.language,
                                            isFavorite: state.favorites.contains(proverb.id),
                                            onToggleFavorite: () =>
                                                state.toggleFavorite(proverb.id),
                                          );
                                        },
                                      )
                                : showPoetryContent
                                    ? favoritePoems.isEmpty
                                        ? _buildEmptyState(loc)
                                        : ListView.separated(
                                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                            itemCount: favoritePoems.length,
                                            separatorBuilder: (_, __) =>
                                                const SizedBox(height: 8),
                                            itemBuilder: (_, i) {
                                              final poem = favoritePoems[i];
                                              return _FavoritePoetryCard(
                                                poem: poem,
                                                isFavorite: state.favorites.contains(poem.id),
                                                onToggleFavorite: () =>
                                                    state.toggleFavorite(poem.id),
                                              );
                                            },
                                          )
                                : _buildEmptyState(loc),
          ),
        ],
      ),
    );
  }

  /// 构建选项卡按钮
  Widget _buildTab(String label, String tab) {
    final isSelected = _selectedTab == tab;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedTab = tab),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFF10B981)
                : const Color(0xFFF0F0F0),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight:
                    isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected
                    ? Colors.white
                    : const Color(0xFF666666),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 空状态
  Widget _buildEmptyState(AppLocalizations loc) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.star_outline,
              size: 64, color: Color(0xFFCCCCCC)),
          const SizedBox(height: 16),
          Text(loc.noFavoritesYet,
              style:
                  const TextStyle(fontSize: 16, color: Color(0xFF999999))),
          const SizedBox(height: 8),
          Text(loc.noFavoritesYetHint,
              style:
                  const TextStyle(fontSize: 13, color: Color(0xFFBBBBBB)),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }

}

/// 单个收藏词语卡片（紧凑横排：中文+拼音 | 翻译 | 播放 | 星形收藏按钮）
class _FavoriteWordCard extends StatelessWidget {
  final WordModel word;
  final String languageCode;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;

  const _FavoriteWordCard({
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
                color: Color(0xFFFF8F00),
              ),
            ),
          ),
          const SizedBox(width: 4),
          // 播放按钮
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

/// 单个收藏成语卡片（紧凑横排 + 查看中文释义按钮）
class _FavoriteIdiomCard extends StatelessWidget {
  final IdiomModel idiom;
  final String languageCode;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;

  const _FavoriteIdiomCard({
    required this.idiom,
    required this.languageCode,
    required this.isFavorite,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
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
        children: [
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
                    color: Color(0xFFFF8F00),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              // 播放按钮
              SoundWaveButton(size: 26, text: idiom.word),
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
          // 查看中文释义按钮
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    title: Text(loc.chineseExplanation,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    content: Text(idiom.explanation,
                        style: const TextStyle(fontSize: 15, color: Color(0xFF666666))),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(ctx),
                        child: Text(loc.close,
                            style: const TextStyle(color: Color(0xFF666666))),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.menu_book, size: 14, color: Color(0xFF666666)),
              label: Text(loc.chineseExplanation,
                  style: const TextStyle(fontSize: 12, color: Color(0xFF666666))),
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFFF5F5F5),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 单个收藏谚语卡片（紧凑横排 + 查看中文释义按钮）
class _FavoriteProverbCard extends StatelessWidget {
  final ProverbModel proverb;
  final String languageCode;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;

  const _FavoriteProverbCard({
    required this.proverb,
    required this.languageCode,
    required this.isFavorite,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
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
        children: [
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
                    color: Color(0xFFFF8F00),
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
          // 查看中文释义按钮
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    title: Text(loc.chineseExplanation,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    content: Text(proverb.explanation,
                        style: const TextStyle(fontSize: 15, color: Color(0xFF666666))),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(ctx),
                        child: Text(loc.close,
                            style: const TextStyle(color: Color(0xFF666666))),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.menu_book, size: 14, color: Color(0xFF666666)),
              label: Text(loc.chineseExplanation,
                  style: const TextStyle(fontSize: 12, color: Color(0xFF666666))),
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFFF5F5F5),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 单个收藏诗词卡片（显示标题、朝代·作者，点击跳转到详情页）
class _FavoritePoetryCard extends StatelessWidget {
  final PoetryModel poem;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;

  const _FavoritePoetryCard({
    required this.poem,
    required this.isFavorite,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/poetry-detail', extra: poem),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
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
          children: [
            // 诗词图标
            const Text('🎋', style: TextStyle(fontSize: 24)),
            const SizedBox(width: 12),
            // 标题 + 朝代·作者
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    poem.title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${poem.dynasty} · ${poem.author}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF999999),
                    ),
                  ),
                ],
              ),
            ),
            // 右箭头
            const Icon(Icons.chevron_right, color: Color(0xFFCCCCCC), size: 20),
            const SizedBox(width: 4),
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
      ),
    );
  }
}
