import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';
import '../l10n/app_localizations.dart';
import '../models/poetry_model.dart';

/// 收藏页诗词详情 — 显示诗词原文、中文释义、母语释义
class PoetryDetailPage extends StatefulWidget {
  final PoetryModel poem;
  const PoetryDetailPage({super.key, required this.poem});

  @override
  State<PoetryDetailPage> createState() => _PoetryDetailPageState();
}

class _PoetryDetailPageState extends State<PoetryDetailPage> {
  bool _showChineseMeaning = false;
  bool _showNativeMeaning = false;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final loc = AppLocalizations.of(context)!;
    final isFav = state.favorites.contains(widget.poem.id);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(bottom: BorderSide(color: Color(0xFFE0E0E0))),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => context.pop(),
                        icon: const Icon(Icons.arrow_back, color: Color(0xFF333333)),
                      ),
                      Text(
                        widget.poem.title,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => state.toggleFavorite(widget.poem.id),
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Icon(
                            isFav ? Icons.star : Icons.star_border,
                            color: isFav ? Colors.amber : Colors.grey,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 朝代 · 作者
                        Text(
                          '${widget.poem.dynasty} · ${widget.poem.author}',
                          style: const TextStyle(fontSize: 14, color: Color(0xFF999999)),
                        ),
                        const SizedBox(height: 20),
                        // 诗词原文
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: const Color(0xFFDCEAFF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            widget.poem.content,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF333333),
                              height: 1.8,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        // 中文释义按钮
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () => setState(() => _showChineseMeaning = true),
                            icon: const Icon(Icons.menu_book, size: 20),
                            label: Text(loc.showChineseMeaning,
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF10B981),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // 母语释义按钮
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () => setState(() => _showNativeMeaning = true),
                            icon: const Icon(Icons.translate, size: 20),
                            label: Text(loc.showNativeMeaning,
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: const Color(0xFF333333),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: const BorderSide(color: Color(0xFFE0E0E0)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // 中文释义对话框
          if (_showChineseMeaning)
            _buildDialog(
              title: loc.chineseExplanation,
              content: widget.poem.chineseMeaning,
              onClose: () => setState(() => _showChineseMeaning = false),
            ),
          // 母语释义对话框
          if (_showNativeMeaning)
            _buildDialog(
              title: loc.showNativeMeaning,
              content: widget.poem.translationFor(state.language),
              onClose: () => setState(() => _showNativeMeaning = false),
            ),
        ],
      ),
    );
  }

  Widget _buildDialog({required String title, required String content, required VoidCallback onClose}) {
    final loc = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: onClose,
      child: Container(
        color: Colors.black54,
        child: Center(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Text(content, style: const TextStyle(color: Color(0xFF666666))),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: onClose,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE0E0E0),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Text(loc.close, style: const TextStyle(color: Color(0xFF666666))),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
