
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';

class CheckoutRowItem extends StatelessWidget {
  final String stageNum;
  final String assetsPath;
  bool isDone;
  CheckoutRowItem({
    super.key,
    required this.stageNum,
    required this.assetsPath,
    required this.isDone,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          stageNum,
          style: AppTextStyles.bodySmallBold.copyWith(
            color: isDone ? AppColors.green1_500 : Color(0xFFAAAAAA),
          ),
        ),
        SizedBox(width: 2),
        SvgPicture.asset(
          assetsPath,
          height: 23.h(context),
          width: 23.w(context),
        ),
      ],
    );
  }
}
