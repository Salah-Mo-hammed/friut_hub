import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/generated/assets.dart';

class CustomSearchBarWidget extends StatelessWidget {
  const CustomSearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
