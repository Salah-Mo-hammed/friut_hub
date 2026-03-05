import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/core/widgets/my_button_widget.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/pages/done_pay_page.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/widgets/checkout_widgets/revision_second_container.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/widgets/checkout_widgets/revision_total_salary_container.dart';
import 'package:friut_hub/generated/assets.dart';

class CheckoutRevisionPage extends StatelessWidget {
  final VoidCallback onNext;
  const CheckoutRevisionPage({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "ملخص الطلب :",
            style: AppTextStyles.bodySmallBold.copyWith(fontSize: 15),
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 128.h(context),
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RevisionTotalSalaryContainer(
                      title: "المجموع الفرعي :",

                      widget2: Text(
                        "150 جنيه",

                        style: AppTextStyles.bodySmall.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      isBold: false,
                    ),
                    SizedBox(height: 5),
                    RevisionTotalSalaryContainer(
                      title: "التوصيل  :",
                      widget2: Text(
                        "30 جنيه",

                        style: AppTextStyles.bodySmall.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      isBold: false,
                    ),
                    Divider(),
                    RevisionTotalSalaryContainer(
                      title: "الكلي",
                      widget2: Text(
                        "180 جنيه",

                        style: AppTextStyles.bodySmall.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      isBold: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Text(
            "يرجي تأكيد  طلبك",
            style: AppTextStyles.bodySmallBold.copyWith(fontSize: 15),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),

            child: RevisionSecondContainer(
              onTap: () {
                // ! go back to  CheckoutPaymentMethod Page (the previous page)
              },
              title: "وسيلة الدفع",
              widget3: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "**** **** **** 6522",
                    style: AppTextStyles.bodyBase.copyWith(
                      color: AppColors.grayscale500,
                    ),
                  ),
                  Container(
                    height: 43,
                    width: 67,
                    decoration: ShapeDecoration(
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignOutside,
                          color: const Color(0xFFD6DCE5),
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        Assets.svgVisa,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: RevisionSecondContainer(
              onTap: () {
                // ! go back to  CheckoutAdress Page (the previous  of previous page)
              },
              title: "عنوان التوصيل",
              widget3: Row(
                children: [
                  Text(
                    "شارع النيل، مبنى رقم ١٢٣",
                    style: AppTextStyles.bodyBase.copyWith(
                      color: AppColors.grayscale500,
                    ),
                  ),

                  SvgPicture.asset(
                    Assets.svgLocation,
                    height: 25,
                    width: 25,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 51.h(context)),
          MyButton(
            onTap: () {
              Navigator.pushNamed(context, DonePayPage.routeName);
            },
            content:
                          Text(  "تأكيد الطلب", style: AppTextStyles.bodyBaseBold),
            
            
          ),
        ],
      ),
    );
  }
}
