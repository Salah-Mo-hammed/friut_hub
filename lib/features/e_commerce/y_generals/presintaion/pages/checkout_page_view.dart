import 'package:flutter/material.dart';
import 'package:friut_hub/core/widgets/app_bar_widget.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/pages/checkout_adress_page.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/pages/checkout_charge_page.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/pages/checkout_payment_page.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/pages/checkout_revision_page.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/widgets/checkout_widgets/checkout_row_item_widget.dart';
import 'package:friut_hub/generated/assets.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});
  static const routeName = "CheckoutCharge";

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController adressController = TextEditingController();

  TextEditingController cityController = TextEditingController();

  TextEditingController apartmentController = TextEditingController();

  TextEditingController mobileController = TextEditingController();

  final PageController _pageController = PageController();
  int currentStep = 0;

  void nextStep() {
    if (currentStep < 3) {
      setState(() => currentStep++);
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
  // ******************************************************

  TextEditingController cardOwnerName = TextEditingController();
  TextEditingController cardNumber = TextEditingController();
  TextEditingController cardEXpireDate = TextEditingController();
  TextEditingController cardCVV = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(appBarTitle: "الشحن"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CheckoutRowItem(
                  stageNum: 'الشحن',
                  assetsPath:
                      currentStep >= 0
                          ? Assets.svgCheckoutCharge
                          : Assets.svgCheckoutAddress,
                  isDone: currentStep >= 0,
                ),
                Spacer(),
                CheckoutRowItem(
                  stageNum: 'العنوان',
                  assetsPath:
                      currentStep >= 1
                          ? Assets.svgCheckoutCharge
                          : Assets.svgCheckoutAddress,
                  isDone: currentStep >= 1,
                ),
                Spacer(),
                CheckoutRowItem(
                  stageNum: 'الدفع',
                  assetsPath:
                      currentStep >= 2
                          ? Assets.svgCheckoutCharge
                          : Assets.svgCheckoutAddress,
                  isDone: currentStep >= 2,
                ),
                Spacer(),
                CheckoutRowItem(
                  stageNum: 'المراجعه',
                  assetsPath:
                      currentStep >= 3
                          ? Assets.svgCheckoutCharge
                          : Assets.svgCheckoutAddress,
                  isDone: currentStep >= 3,
                ),
              ],
            ),
          ),

          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                //! first page (Charge Type Page)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 0, //16,
                    vertical: 0, //20,
                  ),
                  child: CheckOutChargePage(onNext: nextStep),
                ),

                //! second page (Address Page)
                CheckoutAdressPage(
                  fullNameController: fullNameController,
                  adressController: adressController,
                  cityController: cityController,
                  apartmentController: apartmentController,
                  mobileController: mobileController,
                  onNext: nextStep,
                ),

                //! third page (Payment Method Page)
                CheckOutPaymentPage(
                  onNext: nextStep,
                  cardOwnerName: cardOwnerName,
                  cardNumber: cardNumber,
                  cardEXpireDate: cardEXpireDate,
                  cardCVV: cardCVV,
                ),
                //! Forth page (Charge Page)
                CheckoutRevisionPage(onNext: nextStep,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
