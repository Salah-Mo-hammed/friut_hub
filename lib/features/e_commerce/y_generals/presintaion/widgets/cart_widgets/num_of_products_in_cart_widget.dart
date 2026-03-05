
import 'package:flutter/material.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';

class NumProductsInCart extends StatelessWidget {
  const NumProductsInCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41.h(context),
      width: double.infinity,
      decoration: BoxDecoration(color: AppColors.green1_50),
      child: Center(
        child: Text(
          "لديك 3 منتجات في سله التسوق",
          style: AppTextStyles.bodySmallBold.copyWith(
            color: AppColors.green1_500,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
