import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friut_hub/generated/assets.dart';

class StackProfileRate extends StatelessWidget {
  final double rate;
   StackProfileRate({super.key, required this.rate});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 80,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(25),
            child: SizedBox(
              width: 60,
              height: 60,

              child: Image.asset(
                Assets.pngFruitOfferPng,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 30,
            child: SvgPicture.asset(
              height: 70,
              width: 70,
              Assets.svgPersonRate,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            left: 43,
            top: 45,
            child: Text(
              rate.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
