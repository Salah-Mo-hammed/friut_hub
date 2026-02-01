import 'package:flutter/material.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';

class MyButton extends StatelessWidget {
  // final GlobalKey<FormState> _formKey;
  final String buttonTitle;
  void Function()? onTap;
  MyButton({
    super.key,
    required this.onTap,
    required this.buttonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 400,
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.green1_500,
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Text(
              buttonTitle,
              style: AppTextStyles.bodyBaseBold,
            ),
          ),
        ),
      ),
    );
  }
}
