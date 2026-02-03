// ! there is a problem (fill password , then click on show password , it wont be printed)
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:friut_hub/core/widgets/app_bar_widget.dart';
import 'package:friut_hub/features/auth/presentation/pages/fprget_pass_page.dart';
import 'package:friut_hub/features/auth/presentation/pages/polices_page.dart';
import 'package:friut_hub/features/auth/presentation/widgets/password_feild_widget.dart';
import 'package:friut_hub/core/widgets/checkbox_widget.dart';
import 'package:friut_hub/features/auth/presentation/widgets/google_ios_button.dart';
import 'package:friut_hub/core/widgets/my_button_widget.dart';
import 'package:friut_hub/core/widgets/my_text_form_feild_widget.dart';
import 'package:friut_hub/core/widgets/rich_text_widget.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/features/e_commerce/presintaion/pages/home_page.dart';
import 'package:friut_hub/features/e_commerce/presintaion/pages/main_dashboard.dart';
import 'package:friut_hub/generated/assets.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController(
    text: kDebugMode ? "emailController@gmail.com" : null,
  );
  final TextEditingController passwordController =
      TextEditingController(
        text: kDebugMode ? "passwordController" : null,
      );
  bool isRegister;
  TextEditingController nameController = TextEditingController(
    text: kDebugMode ? 'nameController' : null,
  );

  LoginPage({super.key, required this.isRegister});

  static const routeName = '/LoginPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        appBarTitle: !isRegister ? "تسجيل الدخول" : "حساب جديد",
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (isRegister) ...[
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: BuildTextFormFeild(
                  hintLabel: 'الاسم',
                  controller: nameController,
                  validator: (nameV) {
                    if (nameV == null || nameV.isEmpty) {
                      return "هذا الحقل مطلوب";
                    }
                    return null;
                  },
                  obscureText: false,
                ),
              ),
            ],
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
            SizedBox(height: 20),
            PasswordField(
              controller: passwordController,
              validator: (passwordV) {
                if (passwordV == null || passwordV.isEmpty) {
                  return "هذا الحقل مطلوب";
                }
                return null;
              },
            ),

            if (isRegister) ...[
              SizedBox(height: 16),
              Row(
                children: [
                  PoliciesCheckBox(),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.sizeOf(context).width - 50,
                    ),
                    child: RichTextWidget(
                      title1: 'من خلال إنشاء حساب ، فإنك توافق على ',
                      title2: 'الشروط والأحكام الخاصة بنا',
                      onTap: () {
                        // ! Polices page
                        Navigator.pushNamed(
                          context,
                          PolicesPage.routeName,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ] else ...[
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: RichTextWidget(
                  title1: '',
                  title2: 'نسيت كلمة السر؟',
                  onTap: () {
                    //! in forget password , go to forget password
                    Navigator.pushNamed(
                      context,
                      ForgetPasswordPage.routeName,
                    );
                  },
                ),
              ),
            ],
            isRegister ? SizedBox(height: 30) : SizedBox(height: 33),
            //* Button
            MyButton(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  // All fields are valid → ready for backend
                  print(
                    '\x1B[32mEmail: ${emailController.text}\x1B[0m',
                  );
                  print(
                    '\x1B[32mEmail: ${passwordController.text}\x1B[0m',
                  );
                  // ! go to home page after successful (login) or back to login page when register
                  if (isRegister) {
                    Navigator.pop(context);
                  } else {
                    Navigator.pushNamed(
                      context,
                      MainDashboard.routeName,
                    );
                  }
                }
              },

              buttonTitle:
                  isRegister ? "إنشاء حساب جديد" : "تسجيل دخول",
            ),
            SizedBox(height: 33.h(context)),
            //!  ======================== No Account?
            Center(
              child:
                  isRegister
                      ? RichTextWidget(
                        title1: " تمتلك حساب بالفعل؟ ",
                        title2: "تسجيل دخول",
                        onTap: () {
                          //! back to Login page
                          Navigator.pop(context);
                        },
                      )
                      : RichTextWidget(
                        title1: 'لا تمتلك حساب؟ ',
                        title2: 'قم بإنشاء حساب',
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            LoginPage.routeName,
                            arguments: true,
                          );
                        },
                      ),
            ),
            //
            if (!isRegister) ...[
              SizedBox(height: 33.h(context)),

              //! (--------------------  Text --------------------)
              Row(
                children: [
                  Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Text(
                      "أو",
                      style: AppTextStyles.bodyBaseBold.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(child: Divider(thickness: 1)),
                ],
              ),
              SizedBox(height: 33.h(context)),

              OtherSignInButton(
                title: "تسجيل بواسطة جوجل",
                iconSvgPath: Assets.svgGoogleIcon,
                onTap: () {
                  //! sign with google logic
                },
              ),
              SizedBox(height: 16.h(context)),
              OtherSignInButton(
                title: "تسجيل بواسطة ابل",
                iconSvgPath: Assets.svgAppleIcon,
                onTap: () {
                  //! sign with apple logic
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
