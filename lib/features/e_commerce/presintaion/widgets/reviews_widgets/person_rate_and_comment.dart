import 'package:flutter/material.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/reviews_widgets/stack_profile_rate.dart';

class PersonRateAndComment extends StatelessWidget {
  final double rate;
   PersonRateAndComment({super.key, required this.rate});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            StackProfileRate(rate: rate),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(
                children: [
                  Text(
                    "Ahmed Amr",
                    style: AppTextStyles.bodyBaseMedium.copyWith(
                      color: AppColors.grayscale900,
                    ),
                  ),
                  Text(
                    "25/06/2020",
                    style: AppTextStyles.bodyBase.copyWith(
                      color: AppColors.grayscale400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Text(
          "هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها",
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.grayscale500,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
