
import 'package:flutter/material.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/generated/assets.dart';

class NotificationRow extends StatelessWidget {
  int index;
  NotificationRow({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                Assets.png1,
                height: 59.h(context),
                width: 59.w(context),
              ),
              SizedBox(width: 10),
              RichText(
                text: TextSpan(
                  style: AppTextStyles.bodyBase.copyWith(
                    color: AppColors.grayscale400,
                    fontSize: 18,
                  ),
                  children: [
                    TextSpan(text: "خصم "),
                    TextSpan(
                      text: "50%",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text:
                          index == 3
                              ? "it the 3 "
                              : " علي اسعار الفواكه بمناسبه \nالعيد",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
