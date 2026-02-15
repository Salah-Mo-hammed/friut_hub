import 'package:flutter/material.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/core/widgets/app_bar_widget.dart';
import 'package:friut_hub/core/widgets/checkbox_widget.dart';
import 'package:friut_hub/core/widgets/my_button_widget.dart';
import 'package:friut_hub/core/widgets/my_text_form_feild_widget.dart';

class AddPaymentFromProfile extends StatelessWidget {
  TextEditingController cardOwnerName;
  TextEditingController cardNumber;
  TextEditingController cardEXpireDate;
  TextEditingController cardCVV;
  VoidCallback onNext;
  static const routeName = 'AddPaymentFromProfile';
  final _formKey = GlobalKey<FormState>();

  AddPaymentFromProfile({
    super.key,
    required this.cardOwnerName,
    required this.cardNumber,
    required this.cardEXpireDate,
    required this.cardCVV,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(appBarTitle: "اضافه بطاقه جديده"),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: BuildTextFormFeild(
                hintLabel: 'اسم حامل البطاقه',
                controller: cardOwnerName,
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
                controller: cardNumber,
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
                    controller: cardCVV,
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
                    controller: cardEXpireDate,
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
                  onNext();
                }
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
      ),
    );
  }
}
