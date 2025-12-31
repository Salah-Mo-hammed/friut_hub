import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friut_hub/auth/presentation/widgets/app_bar_widget.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/e_commerce/presintaion/pages/profile_page.dart';
import 'package:friut_hub/generated/assets.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: MyAppBar(appBarTitle: "الاشعارات"),
        body: Column(
          children: [
            TowTextsRow(title: "جديد"),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(0),
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      if (index == 3) ...[
                        TowTextsRow(title: "في وقت سابق"),
                      ],
                      NotificationRow(index: index),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationRow extends StatelessWidget {
  int index;
  NotificationRow({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                Assets.png1,
                height: 59.h(context),
                width: 59.w(context),
              ),
              SizedBox(width: 10),
              RichText(
                text: TextSpan(
                  style: AppTextStyles.bodyBase.copyWith(
                    color: AppColors.grayscale400,
                    fontSize: 18,
                  ),
                  children: [
                    TextSpan(text: "خصم "),
                    TextSpan(
                      text: "50%",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text:
                          index == 3
                              ? "it the 3 "
                              : " علي اسعار الفواكه بمناسبه \nالعيد",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TowTextsRow extends StatelessWidget {
  String title;
  TowTextsRow({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                title,
                style: AppTextStyles.bodyBaseBold.copyWith(
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 5),
              CircleAvatar(
                backgroundColor: AppColors.green1_50,
                child: Text(
                  "2",
                  style: AppTextStyles.bodyBaseBold.copyWith(
                    color: AppColors.green1_500,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "تحديد الكل مقروء",
              style: AppTextStyles.bodySmall.copyWith(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
