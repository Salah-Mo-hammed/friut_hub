import 'package:flutter/material.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';

class ProductNameAndPrice extends StatelessWidget {
  final String productName, productPrice;
  const ProductNameAndPrice({
    super.key,
    required this.productName,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          productName, //"بطيخ",
          style: AppTextStyles.bodySmallBold.copyWith(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Text(
              "$productPrice جنية / ",
              style: AppTextStyles.bodySmallBold.copyWith(
                fontSize: 15,
                color: AppColors.orange500,
              ),
            ),
            Text(
              "الكيلو",
              style: AppTextStyles.bodySmallBold.copyWith(
                fontSize: 15,
                color: AppColors.orange300,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
