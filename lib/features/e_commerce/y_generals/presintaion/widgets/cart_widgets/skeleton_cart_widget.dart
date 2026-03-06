import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/widgets/home_widgets/add_icon.dart';
import 'package:friut_hub/generated/assets.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonCartRow extends StatelessWidget {
  const SkeletonCartRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 93.w(context),
                    height: 112.h(context),
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Image.asset(
                      Assets.pngWatermellonPng,
                      width: 73.w(context),
                      height: 60.h(context),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'اسم المنتج',
                          style: AppTextStyles.bodySmallBold.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "3 كم",
                          style: AppTextStyles.bodySmallBold.copyWith(
                            fontSize: 15,
                            color: AppColors.orange500,
                          ),
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          height: 35,
                          child: Row(
                            children: [
                              ItemAddIcon(onTap: () {}),
                              const SizedBox(width: 20),
                              Text(
                                '1',
                                style: AppTextStyles.bodyBaseBold.copyWith(
                                  fontSize: 21,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(width: 20),
                              ItemAddIcon(icon: Icons.remove, onTap: () {}),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 112.h(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(Assets.svgTrash),
                  Text(
                    "60 جنيه",
                    style: AppTextStyles.bodyBaseBold.copyWith(
                      fontSize: 16,
                      color: AppColors.orange500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}