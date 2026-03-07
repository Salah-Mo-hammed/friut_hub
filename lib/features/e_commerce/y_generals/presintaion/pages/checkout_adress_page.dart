import 'package:flutter/material.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/core/widgets/my_button_widget.dart';
import 'package:friut_hub/core/widgets/my_text_form_feild_widget.dart';

class CheckoutAdressPage extends StatefulWidget {
  const CheckoutAdressPage({
    super.key,
    required this.fullNameController,
    required this.adressController,
    required this.cityController,
    required this.apartmentController,
    required this.mobileController,
    required this.onNext,
  });
  final TextEditingController fullNameController;
  final TextEditingController adressController;
  final TextEditingController cityController;
  final TextEditingController apartmentController;
  final TextEditingController mobileController;
  final VoidCallback onNext;

  @override
  State<CheckoutAdressPage> createState() => _CheckoutAdressPageState();
}

class _CheckoutAdressPageState extends State<CheckoutAdressPage> {
  final _formKey = GlobalKey<FormState>();

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
              controller: widget.fullNameController,
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
              controller: widget.adressController,
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
              controller: widget.cityController,
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
              controller: widget.apartmentController,
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
              controller: widget.mobileController,
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
                widget.onNext();
              }
            },
            content: 
                          Text( 'التالي', style: AppTextStyles.bodyBaseBold),
            
            
          ),
        ],
      ),
    );
  }
}
