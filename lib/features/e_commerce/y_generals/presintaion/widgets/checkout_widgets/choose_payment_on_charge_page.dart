import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/generated/assets.dart';

class choosePaymentOnCharge extends StatelessWidget {
  final String paymentMethod;
  final String price;
  bool choosen;
  choosePaymentOnCharge({
    super.key,
    required this.paymentMethod,
    required this.price,
    required this.choosen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w(context),
      height: 56.h(context),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0x33D9D9D9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side:
              choosen == true
                  ? BorderSide(width: 1, color: AppColors.green1_500)
                  : BorderSide.none,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  choosen != true
                      ? Assets.svgRoundedCircle
                      : Assets.svgFilledCircle,
                ),
                SizedBox(width: 5),
                Text(
                  paymentMethod,
                  style: AppTextStyles.bodySmallBold,
                ),
              ],
            ),
            Text(
              price,
              style: AppTextStyles.bodySmallBold.copyWith(
                color: const Color(0xFF3A8B33),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
