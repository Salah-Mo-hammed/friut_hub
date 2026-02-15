import 'package:flutter/material.dart';
import 'package:friut_hub/core/colors/app_colors.dart';

class MyButton extends StatelessWidget {
  // final GlobalKey<FormState> _formKey;
  final Widget content;
  void Function()? onTap;
  bool doLogOut;
  MyButton({
    super.key,
    required this.onTap,
    required this.content,
    this.doLogOut = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 400,
        height: 60,
        decoration: BoxDecoration(
          color: doLogOut ? Colors.white : AppColors.green1_500,
          borderRadius: BorderRadius.circular(15),
          border:
              doLogOut
                  ? Border.all(color: AppColors.green1_500)
                  : null,
        ),
        child: InkWell(onTap: onTap, child: Center(child: content)),
      ),
    );
  }
}
// style: AppTextStyles.bodyBaseBold,