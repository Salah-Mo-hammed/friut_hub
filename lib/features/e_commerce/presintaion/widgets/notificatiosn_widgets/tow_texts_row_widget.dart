
import 'package:flutter/material.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';

class TowTextsRow extends StatelessWidget {
  String title;
  TowTextsRow({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                title,
                style: AppTextStyles.bodyBaseBold.copyWith(
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 5),
              CircleAvatar(
                backgroundColor: AppColors.green1_50,
                child: Text(
                  "2",
                  style: AppTextStyles.bodyBaseBold.copyWith(
                    color: AppColors.green1_500,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "تحديد الكل مقروء",
              style: AppTextStyles.bodySmall.copyWith(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
