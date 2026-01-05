import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:friut_hub/auth/presentation/widgets/app_bar_widget.dart';
import 'package:friut_hub/auth/presentation/widgets/my_text_form_feild_widget.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/generated/assets.dart';

class ReviewsPage extends StatelessWidget {
  TextEditingController reviewController = TextEditingController();
  ReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: MyAppBar(appBarTitle: "المراجعه"),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: reviewController,
                style: AppTextStyles.bodyBaseBold.copyWith(
                  color: Colors.black,
                ),
                // textAlign: TextAlign.start,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      width: 0.3,
                      color: AppColors.grayscale400,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                  hintText: "اكتب التعليق..",
                  hintStyle: AppTextStyles.bodySmallBold.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  // ✅ Show/hide icon
                  prefixIcon: Image.asset(
                    Assets.pngReviewIcon,
                    height: 30.h(context),
                    width: 30.w(context),
                  ),
                ),
              ),

              SizedBox(height: 10),
              Text(
                "324 مراجعه",
                style: AppTextStyles.bodySmallBold.copyWith(
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: Text(
                  "الملخص",
                  style: AppTextStyles.bodySmallMedium.copyWith(
                    color: AppColors.grayscale900,
                    fontSize: 17,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.orange),
                          Text(
                            "4.5",
                            style: AppTextStyles.bodySmallBold
                                .copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h(context)),

                      Text("88%", style: AppTextStyles.bodyBase),

                      Text(
                        "موصي بها",
                        style: AppTextStyles.bodySmall,
                      ),
                    ],
                  ),
                  SizedBox(width: 10.w(context)),

                  Expanded(
                    child: Column(
                      children: [
                        ReviewsInnerRow(1, "5"),
                        SizedBox(height: 10.h(context)),
                        ReviewsInnerRow(.80, "4"),
                        SizedBox(height: 10.h(context)),
                        ReviewsInnerRow(.60, "3"),
                        SizedBox(height: 10.h(context)),
                        ReviewsInnerRow(.40, "2"),
                        SizedBox(height: 10.h(context)),
                        ReviewsInnerRow(.20, "1"),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row ReviewsInnerRow(double barPercent, String barRate) {
    return Row(
      children: [
        Expanded(child: _AnimatedBar(percent: barPercent)),
        SizedBox(width: 10),
        Text(
          barRate,
          style: AppTextStyles.bodySmallBold.copyWith(fontSize: 16),
        ),
      ],
    );
  }
}

class _AnimatedBar extends StatelessWidget {
  final double percent;

  const _AnimatedBar({required this.percent});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: percent),
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeOutCubic,
      builder: (context, value, _) {
        return Container(
          height: 8,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(8),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: value,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        );
      },
    );
  }
}
