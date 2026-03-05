
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';

class BuildPaymentContainer extends StatelessWidget {
  final String cardType;
  const BuildPaymentContainer({super.key, required this.cardType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: ShapeDecoration(
          color: const Color(0xFFF8F8FA),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(cardType, fit: BoxFit.contain),
            ),
            SizedBox(width: 5),
            Text(
              "**** **** **** 6522",
              style: AppTextStyles.bodyBase.copyWith(
                color: AppColors.grayscale500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
