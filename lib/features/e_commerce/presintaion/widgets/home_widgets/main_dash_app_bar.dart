import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/features/e_commerce/presintaion/pages/notifications_page.dart';
import 'package:friut_hub/generated/assets.dart';

class MainDashboardAppBarWidget extends StatelessWidget {
  const MainDashboardAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(Assets.pngPersonIcon, fit: BoxFit.fill),
              SizedBox(width: 5),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
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
                    style: AppTextStyles.bodyBaseBold.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationsPage(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SvgPicture.asset(
                Assets.svgNotificationRing,
                height: 20.h(context),
                width: 20.w(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
