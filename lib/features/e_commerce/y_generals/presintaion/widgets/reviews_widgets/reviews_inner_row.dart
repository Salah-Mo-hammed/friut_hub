
import 'package:flutter/material.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/widgets/reviews_widgets/reviews_bar.dart';

class ReviewsInnerRow extends StatelessWidget {
  double barPercent;
  String barRate;
  ReviewsInnerRow({
    super.key,
    required this.barPercent,
    required this.barRate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: AnimatedBar(percent: barPercent)),
        SizedBox(width: 10),
        Text(
          barRate,
          style: AppTextStyles.bodySmallBold.copyWith(fontSize: 16),
        ),
      ],
    );
  }
}
