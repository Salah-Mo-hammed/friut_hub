import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:friut_hub/auth/presentation/widgets/app_bar_widget.dart';
import 'package:friut_hub/auth/presentation/widgets/my_button_widget.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/e_commerce/presintaion/pages/item_details_page.dart';
import 'package:friut_hub/generated/assets.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,

      child: Scaffold(
        backgroundColor: Color(0xFFF3F5F7),
        appBar: MyAppBar(appBarTitle: "السلة"),
        body: Column(
          children: [
            SizedBox(height: 20),
            Container(
              height: 41.h(context),
              width: double.infinity,
              decoration: BoxDecoration(color: AppColors.green1_50),
              child: Center(
                child: Text(
                  "لديك 3 منتجات في سله التسوق",
                  style: AppTextStyles.bodySmallBold.copyWith(
                    color: AppColors.green1_500,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            SizedBox(
              height: 450,
              width: double.infinity,
              child: ListView.builder(
                itemCount: 4,
                padding: EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Container(
                                width: 93.w(context),
                                height: 112.h(context),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Image.asset(
                                  Assets.pngWatermellonPng,
                                  width: 73.w(context),
                                  height: 60.h(context),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "بطيخ",
                                      style: AppTextStyles
                                          .bodySmallBold
                                          .copyWith(
                                            color: Colors.black,
                                          ),
                                    ),
                                    SizedBox(height: 5),

                                    Text(
                                      "3 كم",
                                      style: AppTextStyles
                                          .bodySmallBold
                                          .copyWith(
                                            fontSize: 15,
                                            color:
                                                AppColors.orange500,
                                          ),
                                    ),
                                    SizedBox(height: 15),
                                    SizedBox(
                                      height: 35,
                                      child: ItemQuantityWidget(
                                        onQuantityChanged:
                                            (valaue) {},
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 112.h(context),
                          child: Column(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset(Assets.svgTrash),
                              Text(
                                "60 جنيه ",
                                style: AppTextStyles.bodyBaseBold
                                    .copyWith(
                                      fontSize: 20,
                                      color: AppColors.orange500,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 30.h(context)),
            // TODO: here instade of 120 , it must be auto calculated
            MyButton(onTap: () {}, buttonTitle: "الدفع  120جنيه"),
          ],
        ),
      ),
    );
  }
}
