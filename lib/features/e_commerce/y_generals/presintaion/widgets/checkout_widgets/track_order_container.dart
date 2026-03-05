import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';

class TrackOrderContainer extends StatelessWidget {
  final bool isSecondContainer;
  final String h1;
  final String subH1;
  final String assetIcon;
  final String h2;
  final String subH2;
  final String price;
  const TrackOrderContainer({
    super.key,
    required this.isSecondContainer,
    required this.h1,
    required this.subH1,
    required this.assetIcon,
    this.h2 = "10",
    this.subH2 = "عدد الطلبات",
    this.price = "250 جنية",
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 5,
      ),
      child: Row(
        children: [
          SvgPicture.asset(assetIcon),
          SizedBox(width: 30), // make it 20
          Column(
            children: [
              Text(
                h1,

                style: AppTextStyles.bodyBaseBold.copyWith(
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 9.h(context)),
              Text(
                subH1,

                style: AppTextStyles.bodySmallMedium.copyWith(
                  color: AppColors.grayscale500,
                ),
              ),
              !isSecondContainer
                  ? Row(
                    children: [
                      Text(
                        price,

                        style: AppTextStyles.bodyBaseBold.copyWith(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(width: 20),
                      Row(
                        children: [
                          Text(
                            subH2,

                            style: AppTextStyles.bodySmallMedium
                                .copyWith(
                                  color: AppColors.grayscale500,
                                ),
                          ),
                          Text(
                            h2,

                            style: AppTextStyles.bodyBaseBold
                                .copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  )
                  : SizedBox(),
            ],
          ),
          SizedBox(),
        ],
      ),
    );
  }
}
