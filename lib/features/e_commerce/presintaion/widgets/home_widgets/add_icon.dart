import 'package:flutter/material.dart';
import 'package:friut_hub/core/colors/app_colors.dart';

class ItemAddIcon extends StatelessWidget {
  IconData icon;
  void Function() onTap;
  ItemAddIcon({
    super.key,
    this.icon = Icons.add,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22,
      backgroundColor:
          icon == Icons.add ? AppColors.green1_500 : Colors.white,
      child: GestureDetector(
        onTap: onTap,

        child: Icon(
          size: 35,
          icon,
          color: icon == Icons.add ? Colors.white : Colors.grey,
        ),
      ),
    );
  }
}
