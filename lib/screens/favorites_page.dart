import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';
import '../l10n/app_localizations.dart';

const _sampleWords = [
  {'chinese': '你好', 'pinyin': 'nǐ hǎo', 'id': 'nihao'},
];

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final loc = AppLocalizations.of(context)!;
    final displayedWords =
        _sampleWords.where((w) => state.favorites.contains(w['id'])).toList();

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
                    Text(loc.myFavoritesTitle,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ),
          // Content
          Expanded(
            child: displayedWords.isEmpty
                ? Center(
                    child: Text(loc.noFavoritesYet,
                        style: const TextStyle(color: Color(0xFF999999))))
                : ListView.separated(
                    padding: const EdgeInsets.all(24),
                    itemCount: displayedWords.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (_, i) {
                      final word = displayedWords[i];
                      final isFav = state.favorites.contains(word['id']);
                      return Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.06),
                                blurRadius: 4,
                                offset: const Offset(0, 2))
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(word['chinese']!,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF333333))),
                                  const SizedBox(height: 4),
                                  Text(word['pinyin']!,
                                      style: const TextStyle(
                                          fontSize: 13,
                                          color: Color(0xFF999999))),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () =>
                                  state.toggleFavorite(word['id']!),
                              icon: Icon(
                                isFav ? Icons.star : Icons.star_border,
                                color:
                                    isFav ? Colors.amber : Colors.grey,
                                size: 24,
                              ),
                            ),
                          ],
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
