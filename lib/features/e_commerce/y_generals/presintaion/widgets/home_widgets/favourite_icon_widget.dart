import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friut_hub/generated/assets.dart';

class favourite_icon_widget extends StatefulWidget {
  const favourite_icon_widget({super.key});

  @override
  State<favourite_icon_widget> createState() =>
      _favourite_icon_widgetState();
}

class _favourite_icon_widgetState
    extends State<favourite_icon_widget> {
  bool didClicked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          didClicked = !didClicked;
        });
      },
      child: SvgPicture.asset(
        didClicked ? Assets.svgHeartFilled : Assets.svgHeart,
      ),
    );
  }
}
