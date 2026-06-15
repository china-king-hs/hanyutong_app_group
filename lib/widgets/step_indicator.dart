import 'package:flutter/material.dart';

/// 步骤指示器（小圆点），total=总步数，current=当前步（0-based）
class StepIndicator extends StatelessWidget {
  final int total;
  final int current;

  const StepIndicator({super.key, required this.total, required this.current});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(total, (i) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: i == current
                ? const Color(0xFF10B981)
                : const Color(0xFFCCCCCC),
          ),
        );
      }),
    );
  }
}
