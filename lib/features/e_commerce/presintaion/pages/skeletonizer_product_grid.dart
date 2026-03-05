import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/home_widgets/add_icon.dart';
import 'package:friut_hub/generated/assets.dart';

// Mirrors CustomItemCardWidget exactly — same layout, fake data
class SkeletonProductCard extends StatelessWidget {
  const SkeletonProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
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
            Positioned(
              bottom: 20,
              right: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'اسم المنتج',
                    style: AppTextStyles.bodySmallBold.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "99 جنية / ",
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
              child: ItemAddIcon(icon: Icons.deblur, onTap: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
