import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';
import '../l10n/app_localizations.dart';
import '../widgets/sound_wave_button.dart';

const _sampleContent = {
  'idioms': [
    {'chinese': '一举两得', 'pinyin': 'yì jǔ liǎng dé', 'id': 'idiom1'}
  ],
  'proverbs': [
    {'chinese': '熟能生巧', 'pinyin': 'shú néng shēng qiǎo', 'id': 'proverb1'}
  ],
  'poetry': [
    {'chinese': '床前明月光', 'pinyin': 'chuáng qián míng yuè guāng', 'id': 'poetry1'}
  ],
  'culture': [
    {'chinese': '春节', 'pinyin': 'chūn jié', 'id': 'culture1'}
  ],
};

// 标题现在使用本地化文本，不再需要硬编码

class AdvancedPractice extends StatefulWidget {
  final String type;
  const AdvancedPractice({super.key, required this.type});

  @override
  State<AdvancedPractice> createState() => _AdvancedPracticeState();
}

class _AdvancedPracticeState extends State<AdvancedPractice> {
  String _step = 'pronunciation';
  int _currentIndex = 0;
  bool _isRecording = false;
  bool _isCancelling = false;
  double _dragStartY = 0;
  bool _showPronScore = false;
  bool _showMeaningScore = false;
  bool _showAnswer = false;
  bool _showChineseExplanation = false;
  Map<String, int> _pronScore = {'tone': 85, 'sound': 90};
  Map<String, int> _meaningScore = {'literal': 80, 'extended': 75, 'practical': 85};

  List<Map<String, String>> get _content =>
      (_sampleContent[widget.type] ?? _sampleContent['idioms']!)
          .cast<Map<String, String>>();

  Map<String, String> get _currentItem => _content[_currentIndex];

  void _handleLongPressStart(LongPressStartDetails details) {
    setState(() {
      _isRecording = true;
      _isCancelling = false;
      _dragStartY = details.globalPosition.dy;
    });
  }

  void _handleLongPressMoveUpdate(LongPressMoveUpdateDetails details) {
    final dy = details.globalPosition.dy - _dragStartY;
    final cancelling = dy < -50;
    if (cancelling != _isCancelling) {
      setState(() => _isCancelling = cancelling);
    }
  }

  void _handleLongPressEnd(LongPressEndDetails details) {
    if (_isCancelling) {
      setState(() {
        _isRecording = false;
        _isCancelling = false;
      });
    } else {
      final rnd = Random();
      setState(() {
        _isRecording = false;
        _isCancelling = false;
        if (_step == 'pronunciation') {
          _pronScore = {'tone': rnd.nextInt(30) + 70, 'sound': rnd.nextInt(30) + 70};
          _showPronScore = true;
        } else {
          _meaningScore = {
            'literal': rnd.nextInt(30) + 70,
            'extended': rnd.nextInt(30) + 70,
            'practical': rnd.nextInt(30) + 70,
          };
          _showMeaningScore = true;
        }
      });
    }
  }

  void _handleNextStep() => setState(() { _showPronScore = false; _step = 'meaning'; });

  void _handleContinue() {
    setState(() { _showMeaningScore = false; _step = 'pronunciation'; });
    if (_currentIndex < _content.length - 1) {
      setState(() => _currentIndex++);
    } else {
      context.pop();
    }
  }

  void _handleRetry() => setState(() => _showMeaningScore = false);

  void _handleSkip() {
    if (_step == 'pronunciation') {
      setState(() => _step = 'meaning');
    } else {
      _handleContinue();
    }
  }

  Color _scoreColor(int s) {
    if (s >= 80) return Colors.green;
    if (s >= 60) return Colors.orange;
    return Colors.red;
  }

  int get _avgMeaning =>
      ((_meaningScore['literal']! + _meaningScore['extended']! + _meaningScore['practical']!) / 3).round();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    final loc = AppLocalizations.of(context)!;
    final isFav = state.favorites.contains(_currentItem['id']);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Stack(
        children: [
          Column(
            children: [
              // Header
              Container(
                color: Colors.white,
                child: SafeArea(
                  bottom: false,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: Color(0xFFE0E0E0)))),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => context.pop(),
                          icon: const Icon(Icons.arrow_back, color: Color(0xFF333333)),
                        ),
                        Text(
                          widget.type == 'idioms' ? loc.idioms :
                          widget.type == 'proverbs' ? loc.proverbs :
                          widget.type == 'poetry' ? loc.poetry :
                          loc.culture,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Step Bar
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 两行步骤显示
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 第一行：步骤1
                        Row(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: _step == 'pronunciation' 
                                    ? const Color(0xFF4285F4) 
                                    : const Color(0xFFE0E0E0),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  '1',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: _step == 'pronunciation' 
                                        ? Colors.white 
                                        : const Color(0xFF999999),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                loc.step1ReadChinese,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: _step == 'pronunciation'
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  color: _step == 'pronunciation'
                                      ? const Color(0xFF4285F4)
                                      : const Color(0xFF999999),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        // 第二行：步骤2
                        Row(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: _step == 'meaning' 
                                    ? const Color(0xFF4285F4) 
                                    : const Color(0xFFE0E0E0),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: _step == 'meaning' 
                                        ? Colors.white 
                                        : const Color(0xFF999999),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                loc.step2Explain,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: _step == 'meaning'
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  color: _step == 'meaning'
                                      ? const Color(0xFF4285F4)
                                      : const Color(0xFF999999),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: _step == 'pronunciation' ? 0.5 : 1.0,
                        backgroundColor: const Color(0xFFE0E0E0),
                        color: const Color(0xFF4285F4),
                        minHeight: 4,
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
                    children: [
                      // Card
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.fromLTRB(20, 24, 20, 48),
                            decoration: BoxDecoration(
                              color: const Color(0xFFDCEAFF),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                Text(_currentItem['chinese']!,
                                    style: const TextStyle(
                                        fontSize: 44, fontWeight: FontWeight.bold, color: Color(0xFF333333))),
                                const SizedBox(height: 8),
                                Text(_currentItem['pinyin']!,
                                    style: const TextStyle(fontSize: 18, color: Color(0xFF999999))),
                              ],
                            ),
                          ),
                          // Star
                          Positioned(
                            top: 8, right: 8,
                            child: IconButton(
                              onPressed: () => state.toggleFavorite(_currentItem['id']!),
                              icon: Icon(isFav ? Icons.star : Icons.star_border,
                                  color: isFav ? Colors.amber : Colors.grey, size: 24),
                            ),
                          ),
                          // 中文释义 button
                          Positioned(
                            bottom: 8, left: 12,
                            child: TextButton.icon(
                              onPressed: () => setState(() => _showChineseExplanation = true),
                              icon: const Icon(Icons.menu_book, size: 16, color: Color(0xFF666666)),
                              label: Text(loc.chineseExplanation,
                                  style: const TextStyle(fontSize: 13, color: Color(0xFF666666))),
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0xFFE0E0E0),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              ),
                            ),
                          ),
                          // Speaker — 声波动画
                          Positioned(
                            bottom: 0,
                            right: 4,
                            child: SoundWaveButton(size: 36),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      // Mic — 按住录音，上滑取消
                      GestureDetector(
                        onLongPressStart: _handleLongPressStart,
                        onLongPressMoveUpdate: _handleLongPressMoveUpdate,
                        onLongPressEnd: _handleLongPressEnd,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          width: _isRecording ? 84 : 72,
                          height: _isRecording ? 84 : 72,
                          decoration: BoxDecoration(
                            color: _isCancelling
                                ? Colors.red
                                : _isRecording
                                    ? const Color(0xFF4285F4)
                                    : Colors.grey[300],
                            shape: BoxShape.circle,
                            boxShadow: _isRecording
                                ? [
                                    BoxShadow(
                                      color: (_isCancelling ? Colors.red : const Color(0xFF4285F4))
                                          .withOpacity(0.4),
                                      blurRadius: 18,
                                      spreadRadius: 6,
                                    )
                                  ]
                                : [],
                          ),
                          child: Icon(
                            _isCancelling ? Icons.close : Icons.mic,
                            color: Colors.white,
                            size: 36,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        _isRecording
                            ? loc.slideUpToCancel
                            : loc.holdToRecord,
                        style: TextStyle(
                          fontSize: 13,
                          color: _isRecording
                              ? (_isCancelling ? Colors.red : const Color(0xFF4285F4))
                              : const Color(0xFF999999),
                          fontWeight: _isRecording ? FontWeight.w600 : FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _step == 'pronunciation' ? loc.tapMicToRead : loc.explainInNativeLanguage,
                        style: const TextStyle(fontSize: 12, color: Color(0xFFBBBBBB)),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: _handleSkip,
                            child: Text(loc.skip, style: const TextStyle(color: Color(0xFF999999))),
                          ),
                          if (_step == 'meaning')
                            TextButton(
                              onPressed: () => setState(() => _showAnswer = true),
                              child: Text(loc.showAnswer, style: const TextStyle(color: Color(0xFF999999))),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Pronunciation Score
          if (_showPronScore)
            _bottomSheet(
              title: loc.pronunciationScore,
              items: [
                _scoreRow(loc.toneAccuracy, _pronScore['tone']!, _scoreColor(_pronScore['tone']!)),
                _scoreRow(loc.soundAccuracy, _pronScore['sound']!, _scoreColor(_pronScore['sound']!)),
              ],
              action: ElevatedButton(
                onPressed: _handleNextStep,
                style: _blueBtn,
                child: Text(loc.nextStepExplain,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),

          // Meaning Score
          if (_showMeaningScore)
            _bottomSheet(
              title: loc.meaningScore,
              items: [
                _scoreRow(loc.literalMeaning, _meaningScore['literal']!, _scoreColor(_meaningScore['literal']!)),
                _scoreRow(loc.extendedMeaning, _meaningScore['extended']!, _scoreColor(_meaningScore['extended']!)),
                _scoreRow(loc.practicalMeaning, _meaningScore['practical']!, _scoreColor(_meaningScore['practical']!)),
              ],
              action: _avgMeaning >= 70
                  ? Column(children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                            color: const Color(0xFFE8F5E9),
                            borderRadius: BorderRadius.circular(8),
                            border: const Border(left: BorderSide(color: Colors.green, width: 4))),
                        child: Text(loc.masteredSuccess,
                            style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(width: double.infinity,
                          child: ElevatedButton(onPressed: _handleContinue, style: _blueBtn,
                              child: Text(loc.continueBtn, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))),
                    ])
                  : Column(children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                            color: const Color(0xFFFFF3E0),
                            borderRadius: BorderRadius.circular(8),
                            border: const Border(left: BorderSide(color: Colors.orange, width: 4))),
                        child: Text(loc.tryAgain,
                            style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(width: double.infinity,
                          child: ElevatedButton(onPressed: _handleRetry,
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                              child: Text(loc.reRecord, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))),
                    ]),
            ),

          // Chinese Explanation Dialog
          if (_showChineseExplanation)
            _dialog(loc.chineseExplanation, loc.dataNotLoaded,
                () => setState(() => _showChineseExplanation = false)),

          // Answer Dialog
          if (_showAnswer)
            _dialog(loc.meaningBelow, loc.meaningPlaceholder,
                () => setState(() => _showAnswer = false)),
        ],
      ),
    );
  }

  Widget _bottomSheet({required String title, required List<Widget> items, required Widget action}) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 20, offset: Offset(0, -4))],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ...items,
            const SizedBox(height: 4),
            action,
          ],
        ),
      ),
    );
  }

  Widget _dialog(String title, String content, VoidCallback onClose) {
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
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
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
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
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

Widget _scoreRow(String label, int score, Color color) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(label, style: const TextStyle(fontSize: 13, color: Color(0xFF666666))),
          Text('$score%', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF4285F4))),
        ]),
        const SizedBox(height: 4),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
              value: score / 100.0, backgroundColor: const Color(0xFFE0E0E0), color: color, minHeight: 8),
        ),
      ],
    ),
  );
}

final _blueBtn = ElevatedButton.styleFrom(
  backgroundColor: const Color(0xFF4285F4),
  padding: const EdgeInsets.symmetric(vertical: 16),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
);
