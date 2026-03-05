
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/widgets/checkout_widgets/revision_total_salary_container.dart';
import 'package:friut_hub/generated/assets.dart';

class RevisionSecondContainer extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Widget widget3;
  const RevisionSecondContainer({
    super.key,
    required this.onTap,
    required this.title,
    required this.widget3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h(context),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Color.fromARGB(126, 217, 218, 218),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RevisionTotalSalaryContainer(
              title: title,

              widget2: GestureDetector(
                onTap: onTap,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Assets.svgVector,
                      height: 16,
                      width: 16,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "تعديل",
                      style: AppTextStyles.bodySmall.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              isBold: true,
            ),

            widget3,
          ],
        ),
      ),
    );
  }
}

