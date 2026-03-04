import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/core/widgets/my_button_widget.dart';
import 'package:friut_hub/features/e_commerce/presintaion/pages/track_order_page.dart';
import 'package:friut_hub/generated/assets.dart';

class DonePayPage extends StatelessWidget {
  const DonePayPage({super.key});

  static const routeName = 'DonePayPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 306.h(context)),
            SvgPicture.asset(Assets.svgChangePassSuccessed),
            SizedBox(height: 33.h(context)),
            Text(
              "تم بنجاح !",
              style: AppTextStyles.bodyBaseBold.copyWith(
                color: Colors.black,
              ),
            ),
            SizedBox(height: 9.h(context)),
            Text(
              "رقم الطلب : 1245789663#",
              style: AppTextStyles.bodySmallMedium.copyWith(
                color: AppColors.grayscale500,
              ),
            ),
            SizedBox(height: 142.h(context)),
            MyButton(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  TrackOrderPage.routeName,
                );
              },
              content: Text(
                "تتبع الطلب",
                style: AppTextStyles.bodyBaseBold,
              ),
            ),
            SizedBox(height: 16.h(context)),

            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
                // Navigator.pushNamed(context, MainDashboard.routeName);
              },
              child: Text(
                'الرئيسية',
                style: AppTextStyles.bodyBaseBold.copyWith(
                  color: AppColors.green1_500,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
