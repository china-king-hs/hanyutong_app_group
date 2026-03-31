import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../l10n/app_localizations.dart';
import '../widgets/sound_wave_button.dart';

const _questions = [
  {
    'id': 1,
    'correct': 1,
  },
  {
    'id': 2,
    'correct': 2,
  },
  {
    'id': 3,
    'correct': 0,
  },
];

class ListeningPractice extends StatefulWidget {
  const ListeningPractice({super.key});

  @override
  State<ListeningPractice> createState() => _ListeningPracticeState();
}

class _ListeningPracticeState extends State<ListeningPractice> {
  int _current = 0;
  int? _selected;
  bool _isSubmitted = false;

  Map<String, dynamic> get _question => _questions[_current];
  double get _progress => (_current + 1) / _questions.length;

  void _handleSubmit() {
    if (_selected == null) return;
    setState(() => _isSubmitted = true);
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      _handleNext();
    });
  }

  void _handleNext() {
    if (_current < _questions.length - 1) {
      setState(() {
        _current++;
        _selected = null;
        _isSubmitted = false;
      });
    } else {
      context.pop();
    }
  }

  Color _optionBgColor(int index) {
    if (!_isSubmitted) {
      return _selected == index ? const Color(0xFFDCEAFF) : Colors.white;
    }
    if (index == _question['correct']) return Colors.green;
    if (index == _selected && index != _question['correct']) return Colors.red;
    return Colors.white;
  }

  Color _optionBorderColor(int index) {
    if (!_isSubmitted) {
      return _selected == index ? const Color(0xFF4285F4) : const Color(0xFFE0E0E0);
    }
    if (index == _question['correct']) return Colors.green;
    if (index == _selected && index != _question['correct']) return Colors.red;
    return const Color(0xFFE0E0E0);
  }

  Color _optionTextColor(int index) {
    if (_isSubmitted &&
        (index == _question['correct'] ||
            (index == _selected && index != _question['correct']))) {
      return Colors.white;
    }
    return const Color(0xFF333333);
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final options = [
      loc.optionA,
      loc.optionB,
      loc.optionC,
      loc.optionD,
    ];

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
                    border: Border(bottom: BorderSide(color: Color(0xFFE0E0E0)))),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(Icons.arrow_back, color: Color(0xFF333333)),
                    ),
                    Text(loc.listeningPracticeTitle,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ),
          // Progress
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(loc.questionProgress.replaceAll('{current}', '${_current + 1}').replaceAll('{total}', '${_questions.length}'),
                    style: const TextStyle(fontSize: 13, color: Color(0xFF666666))),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: _progress,
                    backgroundColor: const Color(0xFFE0E0E0),
                    color: const Color(0xFF4285F4),
                    minHeight: 8,
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
                  // Audio Player Button — 大号声波动画
                  SoundWaveButton(
                    size: 88,
                    color: Colors.deepOrange,
                    iconSize: 44,
                  ),
                  const SizedBox(height: 8),
                  Text(loc.tapToPlay,
                      style: const TextStyle(fontSize: 13, color: Color(0xFF999999))),
                  const SizedBox(height: 24),
                  // Options
                  ...options.asMap().entries.map((entry) {
                    final i = entry.key;
                    final opt = entry.value;
                    return GestureDetector(
                      onTap: _isSubmitted ? null : () => setState(() => _selected = i),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: _optionBgColor(i),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: _optionBorderColor(i), width: 2),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(8)),
                              alignment: Alignment.center,
                              child: Text(
                                String.fromCharCode(65 + i),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: _optionTextColor(i)),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(opt,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: _optionTextColor(i))),
                          ],
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 16),
                  // Buttons
                  Row(
                    children: [
                          TextButton(
                            onPressed: _isSubmitted ? null : _handleNext,
                            child: Text(loc.skip,
                                style: const TextStyle(color: Color(0xFF999999))),
                          ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed:
                              _selected != null && !_isSubmitted ? _handleSubmit : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4285F4),
                            disabledBackgroundColor: const Color(0xFFCCCCCC),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          child: Text(loc.submit,
                              style: const TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
