import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/generated/assets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(243, 245, 247, 1),

        body: Column(
          children: [
            SizedBox(height: 50),
            //! AppBar Row
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        Assets.svgPersonIcon,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(width: 5),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                            ),
                            child: Text(
                              "صباح الخير !..",
                              style: AppTextStyles.bodyBase.copyWith(
                                color: AppColors.grayscale400,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "أحمد مصطفي",
                            style: AppTextStyles.bodyBaseBold
                                .copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    child: SvgPicture.asset(
                      Assets.svgNotificationRing,
                      height: 20.h(context),
                      width: 20.w(context),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h(context)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 343.w(context),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "ابحث عن.......",
                    hintStyle: AppTextStyles.bodySmall,
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: SvgPicture.asset(
                        Assets.svgSearchNormal,
                        height: 30,
                        width: 30,
                      ),
                    ),
                    prefixIconConstraints: BoxConstraints(
                      maxHeight: 40,
                      maxWidth: 40,
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: SvgPicture.asset(
                        Assets.svgFilterNormal,
                        height: 30,
                        width: 30,
                      ),
                    ),
                    suffixIconConstraints: BoxConstraints(
                      maxHeight: 40,
                      maxWidth: 40,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Stack(
              children: [
                Image.asset(Assets.pngOrangeOfferPng),
                Positioned(
                  left: 170.w(context),
                  child: Image.asset(Assets.pngOrangeCircle),
                ),
              ],
            ),
            // SvgPicture.asset('assets/svg/orange_offer.svg'),
          ],
        ),
      ),
    );
  }
}
