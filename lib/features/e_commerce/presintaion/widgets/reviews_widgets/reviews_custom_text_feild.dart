import 'package:flutter/material.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/generated/assets.dart';

class ReviewsCustomTextFeild extends StatelessWidget {
  const ReviewsCustomTextFeild({
    super.key,
    required this.reviewController,
  });

  final TextEditingController reviewController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: reviewController,
      style: AppTextStyles.bodyBaseBold.copyWith(
        color: Colors.black,
      ),
      // textAlign: TextAlign.start,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 0.3,
            color: AppColors.grayscale400,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        hintText: "اكتب التعليق..",
        hintStyle: AppTextStyles.bodySmallBold.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        // ✅ Show/hide icon
        prefixIcon: Image.asset(
          Assets.pngReviewIcon,
          height: 30.h(context),
          width: 30.w(context),
        ),
      ),
    );
  }
}
