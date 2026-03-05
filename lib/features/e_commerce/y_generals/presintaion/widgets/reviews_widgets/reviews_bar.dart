import 'package:flutter/material.dart';

class AnimatedBar extends StatelessWidget {
  final double percent;

  const AnimatedBar({required this.percent});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: percent),
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeOutCubic,
      builder: (context, value, _) {
        return Container(
          height: 8,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(8),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: value,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        );
      },
    );
  }
}
