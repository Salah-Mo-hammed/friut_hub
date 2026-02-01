
import 'package:flutter/material.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';

class ForgetPasswordTexts extends StatelessWidget {
  final String title;
  const ForgetPasswordTexts({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 15,
      ),
      child: Text(
        title,
        style: AppTextStyles.bodyBaseBold.copyWith(
          color: AppColors.grayscale600,
        ),
      ),
    );
  }
}
