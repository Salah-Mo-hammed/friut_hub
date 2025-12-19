import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';

class OtherSignInButton extends StatelessWidget {
  final String title;
  final String iconSvgPath;
  final void Function()? onTap;
  const OtherSignInButton({
    super.key,
    required this.title,
    required this.iconSvgPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 340.w(context),
          height: 56.h(context),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grayscale300),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(),
              Text(
                title,
                style: AppTextStyles.bodyBaseBold.copyWith(
                  color: Colors.black,
                ),
              ),
              SvgPicture.asset(iconSvgPath),
              // SignInButton(Buttons.google, onPressed: (){})
              // FaIcon(FontAwesomeIcons.google, color: Colors.red),
            ],
          ),
        ),
      ),
    );
  }
}
