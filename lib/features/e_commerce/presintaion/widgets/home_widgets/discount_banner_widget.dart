import 'package:flutter/material.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({super.key, required this.discountImage});

  final String discountImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w(context)),
      child: Image.asset(
        discountImage,
        width: 342.w(context),
        height: 158.h(context),
        fit: BoxFit.contain,
      ),
    );
  }
}
