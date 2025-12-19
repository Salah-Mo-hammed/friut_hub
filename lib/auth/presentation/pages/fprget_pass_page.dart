import 'package:flutter/material.dart';
import 'package:friut_hub/auth/presentation/pages/login_page.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';

class ForgetPasswordPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController =
      TextEditingController();
  ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: MyAppBar(appBarTitle: "نسيتها يفالح"),
        // ! Body
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 15,
                ),
                child: Text(
                  "لا تقلق ، ما عليك سوى كتابة البريد الكتروني الخاص بك وسنرسل رمز التحقق.",

                  style: AppTextStyles.bodyBaseBold.copyWith(
                    color: AppColors.grayscale600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: BuildTextFormFeild(
                  hintLabel: 'البريد الالكتروني',
                  controller: emailController,
                  validator: (emailV) {
                    if (emailV == null || emailV.isEmpty) {
                      return "هذا الحقل مطلوب";
                    }
                    return null;
                  },
                  obscureText: false,
                ),
              ),
              SizedBox(height: 33),
              MyButton(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    // All fields are valid → ready for backend
                    print(
                      '\x1B[32mEmail: ${emailController.text}\x1B[0m',
                    );

                    // ! go to NextPage OF forget password
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => isRegister?LoginPage() // Note: you can do register then sign in and also go HomePage
                    // :HomePage(),
                    //   ),
                    // );
                  }
                },
                buttonTitle: "نسيت كلمة المرور",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
