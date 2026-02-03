import 'package:flutter/material.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';

class ProductNameAndPrice extends StatelessWidget {
  const ProductNameAndPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Text(
          "بطيخ",
          style: AppTextStyles.bodySmallBold
              .copyWith(
                fontSize: 20,
                color: Colors.black,
              ),
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Text(
              "20جنية / ",
              style: AppTextStyles
                  .bodySmallBold
                  .copyWith(
                    fontSize: 15,
                    color:
                        AppColors.orange500,
                  ),
            ),
            Text(
              "الكيلو",
              style: AppTextStyles
                  .bodySmallBold
                  .copyWith(
                    fontSize: 15,
                    color:
                        AppColors.orange300,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
