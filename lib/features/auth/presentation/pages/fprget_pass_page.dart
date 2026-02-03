import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:friut_hub/features/auth/presentation/pages/pass_recovery_page.dart';
import 'package:friut_hub/core/widgets/app_bar_widget.dart';
import 'package:friut_hub/core/widgets/my_button_widget.dart';
import 'package:friut_hub/core/widgets/my_text_form_feild_widget.dart';

import 'package:friut_hub/features/auth/presentation/widgets/forget_pass_texts_widget.dart';

class ForgetPasswordPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController(
    text: kDebugMode ? "emailController@gmail.com" : null,
  );
  ForgetPasswordPage({super.key});

  static const routeName = "ForgetPassword";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(appBarTitle: "نسيتها يفالح"),
      // ! Body
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            ForgetPasswordTexts(
              title:
                  "لا تقلق ، ما عليك سوى كتابة البريد الكتروني الخاص بك وسنرسل رمز التحقق.",
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
                  Navigator.pushNamed(
                    context,
                    PasswoedRecoveryPage.routeName,
                  );
                }
              },
              buttonTitle: "نسيت كلمة المرور",
            ),
          ],
        ),
      ),
    );
  }
}
