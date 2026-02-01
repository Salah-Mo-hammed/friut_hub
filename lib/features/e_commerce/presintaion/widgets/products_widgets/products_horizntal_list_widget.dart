import 'package:flutter/material.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/generated/assets.dart';

class ProductsHorizntalList extends StatelessWidget {
  const ProductsHorizntalList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h(context),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 39,
                  child: Image.asset(
                    Assets.pngWatermellonPng,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 10.h(context)),
                Text("بطيخ", style: AppTextStyles.bodySmallBold),
              ],
            ),
          );
        },
      ),
    );
  }
}
