import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/core/widgets/checkbox_widget.dart';
import 'package:friut_hub/core/widgets/my_button_widget.dart';
import 'package:friut_hub/core/widgets/my_text_form_feild_widget.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/checkout_widgets/choose_card_payment_method_widget.dart';
import 'package:friut_hub/generated/assets.dart';

class CheckOutPaymentPage extends StatefulWidget {
  final VoidCallback onNext;
  final TextEditingController cardOwnerName;
  final TextEditingController cardNumber;
  final TextEditingController cardEXpireDate;
  final TextEditingController cardCVV;
  const CheckOutPaymentPage({
    super.key,
    required this.cardOwnerName,
    required this.cardNumber,
    required this.cardEXpireDate,
    required this.cardCVV,
    required this.onNext,
  });

  @override
  State<CheckOutPaymentPage> createState() =>
      _CheckOutPaymentPageState();
}

class _CheckOutPaymentPageState extends State<CheckOutPaymentPage> {
  final _formKey = GlobalKey<FormState>();

  int _selectedPaymentMethod = 0;

  void _onSelect(int index) {
    setState(() => _selectedPaymentMethod = index);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.h(context)),
          Text(
            "أختار طريقه الدفع المناسبه :",
            style: AppTextStyles.bodySmallBold.copyWith(fontSize: 17),
          ),
          SizedBox(height: 13.h(context)),
          Text(
            "من فضلك اختر طريقه الدفع المناسبه لك.",
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.grayscale600,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 13.h(context)),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ChooseCardPaymentMethod(
                isSelected: _selectedPaymentMethod == 3,
                selectedCard: Assets.svgApplePaySelected,
                unSelectedCard: Assets.svgApplePayUnselected,
                onTap: () => _onSelect(3),
              ),
              ChooseCardPaymentMethod(
                isSelected: _selectedPaymentMethod == 2,
                selectedCard: Assets.svgPaypal,
                unSelectedCard: Assets.svgPaypal,
                onTap: () => _onSelect(2),
              ),
              ChooseCardPaymentMethod(
                isSelected: _selectedPaymentMethod == 1,
                selectedCard: Assets.svgMastercard,
                unSelectedCard: Assets.svgMastercard,
                onTap: () => _onSelect(1),
              ),
              ChooseCardPaymentMethod(
                isSelected: _selectedPaymentMethod == 0,
                selectedCard: Assets.svgVisa,
                unSelectedCard: Assets.svgVisaUnselected,
                onTap: () => _onSelect(0),
              ),
            ],
          ),
          SizedBox(height: 16.h(context)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: BuildTextFormFeild(
              hintLabel: 'اسم حامل البطاقه',
              controller: widget.cardOwnerName,
              validator: (emailV) {
                if (emailV == null || emailV.isEmpty) {
                  return "هذا الحقل مطلوب";
                }
                return null;
              },
              obscureText: false,
            ),
          ),
          SizedBox(height: 8.h(context)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: BuildTextFormFeild(
              hintLabel: 'رقم البطاقة',
              controller: widget.cardNumber,
              validator: (emailV) {
                if (emailV == null || emailV.isEmpty) {
                  return "هذا الحقل مطلوب";
                }
                return null;
              },
              obscureText: false,
            ),
          ),
          SizedBox(height: 8.h(context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 163.w(context),
                child: BuildTextFormFeild(
                  hintLabel: 'CVV',
                  controller: widget.cardCVV,
                  validator: (emailV) {
                    if (emailV == null || emailV.isEmpty) {
                      return "هذا الحقل مطلوب";
                    }
                    return null;
                  },
                  obscureText: false,
                ),
              ),
              SizedBox(
                width: 163.w(context),
                child: BuildTextFormFeild(
                  hintLabel: 'تاريخ الصلاحيه',
                  controller: widget.cardEXpireDate,
                  validator: (emailV) {
                    if (emailV == null || emailV.isEmpty) {
                      return "هذا الحقل مطلوب";
                    }
                    return null;
                  },
                  obscureText: false,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h(context)),
          Row(
            children: [
              SizedBox(
                width: 250,
                child: PoliciesCheckBox(
                  title: "جعل البطاقة افتراضية",
                  validator: (value) {
                 
                    return null;
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 62.h(context)),

          //
          MyButton(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                widget.onNext();
              }
            },
            content: 
                          Text( 'تأكيد & استمرار', style: AppTextStyles.bodyBaseBold),
            
            
          ),
        ],
      ),
    );
  }
}
