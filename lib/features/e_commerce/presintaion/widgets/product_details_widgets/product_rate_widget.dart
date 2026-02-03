import 'package:flutter/material.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';

class ProductRate extends StatelessWidget {
  const ProductRate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 5),
        Icon(Icons.star, color: Colors.amber),
        SizedBox(width: 5),
    
        Text("(+30)"),
        SizedBox(width: 5),
    
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: "المراجعه",
                style: AppTextStyles.bodyBaseBold
                    .copyWith(
                      color: AppColors.green1_500,
                      decoration:
                          TextDecoration
                              .underline,
                      fontSize: 15,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
