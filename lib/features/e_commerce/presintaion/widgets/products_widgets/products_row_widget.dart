import 'package:flutter/material.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';

class ProductRow extends StatelessWidget {
  String text1;
  final Widget widget2;
  ProductRow({super.key, required this.text1, required this.widget2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1,
            style: AppTextStyles.bodyBaseBold.copyWith(
              color: Colors.black,
            ),
          ),
          widget2,
        ],
      ),
    );
  }
}
