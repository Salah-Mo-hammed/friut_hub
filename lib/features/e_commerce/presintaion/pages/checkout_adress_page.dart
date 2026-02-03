import 'package:flutter/material.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/widgets/my_button_widget.dart';
import 'package:friut_hub/core/widgets/my_text_form_feild_widget.dart';

class CheckoutAdressPage extends StatelessWidget {
  CheckoutAdressPage({
    super.key,
    required this.fullNameController,
    required this.adressController,
    required this.cityController,
    required this.apartmentController,
    required this.mobileController,
    required this.onNext,
  });
  final _formKey = GlobalKey<FormState>();

  final TextEditingController fullNameController;
  final TextEditingController adressController;
  final TextEditingController cityController;
  final TextEditingController apartmentController;
  final TextEditingController mobileController;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: 24.h(context)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BuildTextFormFeild(
              hintLabel: 'الاسم كامل',
              controller: fullNameController,
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BuildTextFormFeild(
              hintLabel: 'العنوان',
              controller: adressController,
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BuildTextFormFeild(
              hintLabel: 'المدينه',
              controller: cityController,
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BuildTextFormFeild(
              hintLabel: 'الشقة',
              controller: apartmentController,
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BuildTextFormFeild(
              hintLabel: 'رقم الهاتف',
              controller: mobileController,
              validator: (emailV) {
                if (emailV == null || emailV.isEmpty) {
                  return "هذا الحقل مطلوب";
                }
                return null;
              },
              obscureText: false,
            ),
          ),
          SizedBox(height: 114.h(context)),
          MyButton(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                onNext();
              }
            },
            buttonTitle: 'التالي',
          ),
        ],
      ),
    );
  }
}
