import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:friut_hub/core/widgets/app_bar_widget.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/reviews_widgets/person_rate_and_comment.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/reviews_widgets/reviews_custom_text_feild.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/reviews_widgets/reviews_inner_row.dart';

class ReviewsPage extends StatelessWidget {
  static const routeName = "ReviewsPage";
  TextEditingController reviewController = TextEditingController(
    text: kDebugMode ? "reviewController" : null,
  );
  ReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(appBarTitle: "المراجعه"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReviewsCustomTextFeild(
                reviewController: reviewController,
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
                        ReviewsInnerRow(barPercent: 1, barRate: '5'),
                        SizedBox(height: 10.h(context)),
                        ReviewsInnerRow(
                          barPercent: 0.8,
                          barRate: '4',
                        ),
                        SizedBox(height: 10.h(context)),
                        ReviewsInnerRow(
                          barPercent: 0.6,
                          barRate: '3',
                        ),
                        SizedBox(height: 10.h(context)),
                        ReviewsInnerRow(
                          barPercent: 0.4,
                          barRate: '2',
                        ),
                        SizedBox(height: 10.h(context)),
                        ReviewsInnerRow(
                          barPercent: 0.2,
                          barRate: '1',
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16),
              PersonRateAndComment(rate: 5),
              SizedBox(height: 16),
              PersonRateAndComment(rate: 4.5),
              SizedBox(height: 16),
              PersonRateAndComment(rate: 0.3),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
