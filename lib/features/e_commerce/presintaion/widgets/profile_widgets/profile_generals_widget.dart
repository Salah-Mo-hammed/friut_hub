import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/profile_widgets/switch_button_widget.dart';

class ProfileGenerals extends StatelessWidget {
  final String imageAsset;
  final String title;
  final void Function()? onPressed;
  bool isNotification;

  ProfileGenerals({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.onPressed,
    this.isNotification = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              imageAsset,
              height: 20.h(context),
              width: 20.w(context),
            ),
            SizedBox(width: 10),
            Text(
              title,
              style: AppTextStyles.bodyBase.copyWith(
                color: AppColors.grayscale400,
                fontSize: 18,
              ),
            ),
          ],
        ),
        if (!isNotification) ...[
          IconButton(
            onPressed: onPressed,
            icon: Icon(Icons.arrow_forward_ios),
          ),
        ] else ...[
          SwitchButtonWidget(),
        ],
      ],
    );
  }
}
