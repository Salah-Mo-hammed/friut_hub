import 'package:flutter/material.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/core/widgets/app_bar_widget.dart';
import 'package:friut_hub/core/widgets/my_button_widget.dart';
import 'package:friut_hub/features/e_commerce/presintaion/pages/add_payment_from_profile_page.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/profile_widgets/build_payment_container.dart';
import 'package:friut_hub/generated/assets.dart';

class PaymentsPage extends StatelessWidget {
  TextEditingController cardOwnerName = TextEditingController();
  TextEditingController cardNumber = TextEditingController();
  TextEditingController cardEXpireDate = TextEditingController();
  TextEditingController cardCVV = TextEditingController();
  static const routeName = "PaymentsPage";
  PaymentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(appBarTitle: "المدفوعات"),
      body: Column(
        children: [
          BuildPaymentContainer(cardType: Assets.svgVisaUnselected),
          SizedBox(height: 5),
          BuildPaymentContainer(cardType: Assets.svgMastercard),
          SizedBox(height: 5),

          BuildPaymentContainer(cardType: Assets.svgAppleIcon),
          SizedBox(height: 5),

          BuildPaymentContainer(cardType: Assets.svgPaypal),
          SizedBox(height: 358),
          MyButton(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => AddPaymentFromProfile(
                        cardOwnerName: cardOwnerName,
                        cardNumber: cardNumber,
                        cardEXpireDate: cardEXpireDate,
                        cardCVV: cardCVV,
                        onNext: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                      ),
                ),
              );
            },
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "أضف وسيلة دفع جديده",
                  style: AppTextStyles.bodyBaseBold,
                ),
                SizedBox(width: 5),
                Icon(Icons.add, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
