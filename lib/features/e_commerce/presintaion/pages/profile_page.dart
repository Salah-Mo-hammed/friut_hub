import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/profile_widgets/profile_generals_widget.dart';
import 'package:friut_hub/generated/assets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 70.h(context)),
              Center(
                child: Text(
                  "حسابي",
                  style: AppTextStyles.bodyBaseBold.copyWith(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(height: 20.h(context)),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset(
                      Assets.pngPersonIcon,
                      fit: BoxFit.fill,
                    ),
                    // SvgPicture.asset(
                    //   Assets.svgPersonIcon,
                    //   fit: BoxFit.fill,
                    // ),
                    SizedBox(width: 5),
                    Column(
                      children: [
                        Text(
                          "أحمد مصطفي",
                          style: AppTextStyles.bodyBaseBold.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "mail@mail.com",
                          style: AppTextStyles.bodyBase.copyWith(
                            color: AppColors.grayscale400,
                          ),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text(
                  "عام",
                  style: AppTextStyles.bodyBaseBold.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ProfileGenerals(
                  imageAsset: Assets.svgUser,
                  title: 'الملف الشخصي',
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Divider(),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ProfileGenerals(
                  imageAsset: Assets.svgBox,
                  title: 'طلباتي',
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Divider(),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ProfileGenerals(
                  imageAsset: Assets.svgHeart,
                  title: 'المفضلة',
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Divider(),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ProfileGenerals(
                  imageAsset: Assets.svgNotification,
                  title: 'الاشعارات',
                  isNotification: true,
                  onPressed: () {},
                ),
              ),
            ],
          ),

          Container(
            height: 41.h(context),
            width: double.infinity,
            decoration: BoxDecoration(color: AppColors.green1_50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(),
                Text(
                  "تسجيل الخروج",
                  style: AppTextStyles.bodySmallBold.copyWith(
                    color: AppColors.green1_500,
                    fontSize: 15,
                  ),
                ),
                SvgPicture.asset(Assets.svgExitIcon),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

