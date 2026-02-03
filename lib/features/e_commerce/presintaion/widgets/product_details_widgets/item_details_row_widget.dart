import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';

class ItemDetailsRow extends StatelessWidget {
  String svgImage;
  String text1;
  String text2;
  ItemDetailsRow({
    super.key,
    required this.svgImage,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text1,
              style: AppTextStyles.bodyBaseBold.copyWith(
                color: AppColors.green1_600,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 5),
            Text(
              text2,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.grayscale500,
                fontSize: 18,
              ),
            ),
          ],
        ),
        SizedBox(width: 10),
        SvgPicture.asset(
          svgImage,
          height: 50.h(context),
          width: 50.w(context),
        ),
      ],
    );
  }
}
