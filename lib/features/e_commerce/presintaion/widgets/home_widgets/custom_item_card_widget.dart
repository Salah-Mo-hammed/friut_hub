import 'package:flutter/material.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/features/e_commerce/presintaion/pages/item_details_page.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/home_widgets/add_icon.dart';
import 'package:friut_hub/generated/assets.dart';

class CustomItemCardWidget extends StatelessWidget {
  const CustomItemCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Stack(
        children: [
          Positioned(
            top: 20,
            right: 40,
            child: Image.asset(
              height: 120,
              width: 120,
              Assets.pngFruitBasketAmico1Splash1,
            ),
          ),
          // ! same problem
          // Center(
          // child: SvgPicture.asset(Assets.svgFarawlla),
          // ),
          Positioned(
            bottom: 20,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "بطيخ",
                  style: AppTextStyles.bodySmallBold.copyWith(
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "20جنية / ",
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
            ),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            child: ItemAddIcon(
              onTap:
                  () => Navigator.pushNamed(
                    context,
                    ItemDetailsPage.routeName
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
