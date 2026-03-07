import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:friut_hub/core/widgets/app_bar_widget.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/pages/checkout_adress_page.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/pages/checkout_charge_page.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/pages/checkout_payment_page.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/pages/checkout_revision_page.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/widgets/checkout_widgets/checkout_row_item_widget.dart';
import 'package:friut_hub/generated/assets.dart';

class CheckoutPage extends StatefulWidget {
  final double totalPrice;
  const CheckoutPage({super.key, required this.totalPrice});
  static const routeName = "CheckoutCharge";

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  //! first page
  int selectedChargeWay = 0;
  //! second page
  TextEditingController fullNameController = TextEditingController(
    text: kDebugMode ? "صلاح محمد حسن" : null,
  );

  TextEditingController adressController = TextEditingController(
    text: kDebugMode ? "خانيونس" : null,
  );

  TextEditingController cityController = TextEditingController(
    text: kDebugMode ? "غزة" : null,
  );

  TextEditingController apartmentController = TextEditingController(
    text: kDebugMode ? "2" : null,
  );

  TextEditingController mobileController = TextEditingController(
    text: kDebugMode ? "01069078099" : null,
  );

  //!  third page
  int selectedPaymentMethod = 0;
  TextEditingController cardOwnerName = TextEditingController(
    text: kDebugMode ? "انا يعني مين" : null,
  );
  TextEditingController cardNumber = TextEditingController(
    text: kDebugMode ? "1234 5678 9101 1213" : null,
  );
  TextEditingController cardCVV = TextEditingController(
    text: kDebugMode ? "123" : null,
  );
  TextEditingController cardEXpireDate = TextEditingController(
    text: kDebugMode ? "12/12" : null,
  );
  bool useCardAsDefault = true;

  final PageController _pageController = PageController();
  int currentStep = 0;

  void _onChargeWayChanged(int value) =>
      setState(() => selectedChargeWay = value);
  void _onPaymentMethodChanged(int value) =>
      setState(() => selectedPaymentMethod = value);
  void _onUseCardAsDefaultChanged(bool value) =>
      setState(() => useCardAsDefault = value);

  void nextStep() {
    if (currentStep < 3) {
      setState(() => currentStep++);
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void prevStep(int pageIndex) {
    setState(() => currentStep = pageIndex);
    _pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

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
                          : Assets.svgCheckoutPaymentMethod,
                  isDone: currentStep >= 2,
                ),
                Spacer(),
                CheckoutRowItem(
                  stageNum: 'المراجعه',
                  assetsPath:
                      currentStep >= 3
                          ? Assets.svgCheckoutCharge
                          : Assets.svgCheckoutRevision,
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
                  child: CheckOutChargePage(
                    onNext: nextStep,
                    selectedChargeWay: selectedChargeWay,
                    onChargeWayChanged: _onChargeWayChanged,
                  ),
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
                  selectedPaymentMethod: selectedPaymentMethod,
                  onPaymentMethodChanged: _onPaymentMethodChanged,
                  onUseCardAsDefaultChanged:
                      _onUseCardAsDefaultChanged,
                ),
                //! Forth page (Charge Page)
                CheckoutRevisionPage(
                  onNext: nextStep,
                  totalPrice: widget.totalPrice,
                  deliveryPrice: selectedChargeWay == 0 ? 40 : 10,
                  selectedPaymentMethod: selectedPaymentMethod,
                  fullNameController: fullNameController,
                  adressController: adressController,
                  cityController: cityController,
                  apartmentController: apartmentController,
                  mobileController: mobileController,
                  cardOwnerName: cardOwnerName,
                  cardNumber: cardNumber,
                  cardCVV: cardCVV,
                  cardEXpireDate: cardEXpireDate,
                  useCardAsDefault: useCardAsDefault,
                  onGoToPage: prevStep,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
