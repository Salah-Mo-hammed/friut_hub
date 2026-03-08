import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/core/widgets/my_button_widget.dart';
import 'package:friut_hub/features/e_commerce/cart/presintation/bloc/cart_bloc.dart';
import 'package:friut_hub/features/e_commerce/order/domain/entities/create_order_param.dart';
import 'package:friut_hub/features/e_commerce/order/presintaion/bloc/order_bloc.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/pages/done_pay_page.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/widgets/checkout_widgets/revision_second_container.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/widgets/checkout_widgets/revision_total_salary_container.dart';
import 'package:friut_hub/generated/assets.dart';

class CheckoutRevisionPage extends StatelessWidget {
  final VoidCallback onNext;
  final void Function(int pageIndex) onGoToPage;
  final double totalPrice;
  final double deliveryPrice;

  //! second page
  TextEditingController fullNameController;

  TextEditingController adressController;

  TextEditingController cityController;

  TextEditingController apartmentController;

  TextEditingController mobileController;

  //!  third page
  int selectedPaymentMethod;
  TextEditingController cardOwnerName;
  TextEditingController cardNumber;
  TextEditingController cardCVV;
  TextEditingController cardEXpireDate;
  bool useCardAsDefault;

  CheckoutRevisionPage({
    super.key,
    required this.onNext,
    required this.totalPrice,
    required this.deliveryPrice,
    required this.selectedPaymentMethod,
    required this.fullNameController,
    required this.adressController,
    required this.cityController,
    required this.apartmentController,
    required this.mobileController,
    required this.cardOwnerName,
    required this.cardNumber,
    required this.cardCVV,
    required this.cardEXpireDate,
    required this.useCardAsDefault,
    required this.onGoToPage,
  });

  void printCheckoutData() {
    debugPrint('============ Checkout Data ============');
    debugPrint('totalPrice: $totalPrice');
    debugPrint('deliveryPrice: $deliveryPrice');
    debugPrint('--- Page 1: Charge ---');
    debugPrint('--- Page 2: Address ---');
    debugPrint('fullName: ${fullNameController.text}');
    debugPrint('address: ${adressController.text}');
    debugPrint('city: ${cityController.text}');
    debugPrint('apartment: ${apartmentController.text}');
    debugPrint('mobile: ${mobileController.text}');
    debugPrint('--- Page 3: Payment ---');
    debugPrint('selectedPaymentMethod: $selectedPaymentMethod');
    debugPrint('cardOwnerName: ${cardOwnerName.text}');
    debugPrint('cardNumber: ${cardNumber.text}');
    debugPrint('cardCVV: ${cardCVV.text}');
    debugPrint('cardExpireDate: ${cardEXpireDate.text}');
    debugPrint('useCardAsDefault: $useCardAsDefault');
    debugPrint('=======================================');
  }

  List<String> cards = [
    Assets.svgVisa, //0
    Assets.svgMastercard, //1
    Assets.svgPaypal, // 2
    Assets.svgApplePaySelected, // 3
  ];
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
                        "${totalPrice.toString()} جنيه",

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
                        "${deliveryPrice.toString()} جنيه",

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
                        "${(totalPrice + deliveryPrice).toString()} جنيه",

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

          if (deliveryPrice == 10) ...[
            Text(
              "يرجي تأكيد  طلبك",
              style: AppTextStyles.bodySmallBold.copyWith(
                fontSize: 15,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),

              child: RevisionSecondContainer(
                onTap: () => onGoToPage(1),
                title: "وسيلة الدفع",
                widget3: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cardNumber.text.toString(),
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
                            strokeAlign:
                                BorderSide.strokeAlignOutside,
                            color: const Color(0xFFD6DCE5),
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          cards[selectedPaymentMethod],
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: RevisionSecondContainer(
              onTap: () => onGoToPage(2),
              title: "عنوان التوصيل",
              widget3: Row(
                children: [
                  Text(
                    "${adressController.text}, ${cityController.text}, ${apartmentController.text}  ",
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
              printCheckoutData();
              CreateOrderParamEntity orderParams =
                  CreateOrderParamEntity(
                    customerFullName: fullNameController.text,
                    customerAddress: adressController.text,
                    customerCity: cityController.text,
                    customerDepartment: int.parse(
                      apartmentController.text,
                    ),
                    customerPhoneNumber: mobileController.text,
                  );
              context.read<OrderBloc>().add(
                CreateOrderEvent(orderParams: orderParams),
              );
            },
            content: Text(
              "تأكيد الطلب",
              style: AppTextStyles.bodyBaseBold,
            ),
          ),
        ],
      ),
    );
  }
}
