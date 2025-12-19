import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';

class RichTextWidget extends StatelessWidget {
  String title1;
  String title2;
  void Function()? onTap;
  RichTextWidget({
    super.key,
    required this.title1,
    required this.title2,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: title1,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.grayscale600,

              fontSize: 15,
            ),
          ),
          TextSpan(
            //! recognizer as gesture detector , but with some changes
            recognizer: TapGestureRecognizer()..onTap = onTap,
            text: title2,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.green1_500,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
