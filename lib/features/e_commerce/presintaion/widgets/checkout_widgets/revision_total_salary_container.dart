import 'package:flutter/material.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';

class RevisionTotalSalaryContainer extends StatelessWidget {
  final String title;
  final Widget widget2;
  final bool isBold;
  const RevisionTotalSalaryContainer({
    super.key,
    required this.title,
    required this.widget2,
    required this.isBold,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,

          style: AppTextStyles.bodySmallMedium.copyWith(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            fontSize: 16,
          ),
        ),
        widget2,
      ],
    );
  }
}
