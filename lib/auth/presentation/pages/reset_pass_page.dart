import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:friut_hub/auth/presentation/pages/fprget_pass_page.dart';
import 'package:friut_hub/auth/presentation/pages/login_page.dart';
import 'package:friut_hub/auth/presentation/widgets/app_bar_widget.dart';
import 'package:friut_hub/auth/presentation/widgets/my_button_widget.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/features/widgets/password_feild_widget.dart';
import 'package:friut_hub/generated/assets.dart';

class ResetPasswordPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController =
      TextEditingController();
  final TextEditingController confirmPassController =
      TextEditingController();

  ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: MyAppBar(appBarTitle: "كلمة مرور جديدة"),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              ForgetPasswordTexts(
                title: "قم بإنشاء كلمة مرور جديدة لتسجيل الدخول",
              ),
              SizedBox(height: 34.h(context)),
              PasswordField(
                controller: passwordController,
                validator: (String? p1) {
                  if (p1 == null || p1.isEmpty) {
                    return "هذا الحقل مطلوب";
                  }
                  return null;
                },
                hint: 'كلمة السر الجديدة',
              ),
              SizedBox(height: 24.h(context)),
              PasswordField(
                hint: "تأكيد كلمة السر الجديدة",
                controller: confirmPassController,
                validator: (String? p1) {
                  if (p1 == null || p1.isEmpty) {
                    return "هذا الحقل مطلوب";
                  }
                  return null;
                },
              ),
              SizedBox(height: 24.h(context)),
              MyButton(
                onTap: () {
                  // ! if success , show small page with Congrats

                  if (_formKey.currentState!.validate()) {
                    // All fields are valid → ready for backend
                    print(
                      '\x1B[32mEmail: ${passwordController.text}\x1B[0m',
                    );
                    print(
                      '\x1B[32mEmail: ${confirmPassController.text}\x1B[0m',
                    );

                    showDialog(
                      context: context,
                      builder:
                          (context) => AlertDialog(
                            title: Column(
                              children: [
                                SvgPicture.asset(
                                  height: 107.h(context),
                                  width: 154.h(context),
                                  Assets.svgChangePassSuccessed,
                                ),
                                SizedBox(height: 20),
                                Text(
                                  "تم تغيير الباسورد بنجاح",
                                  style: AppTextStyles.bodyBaseBold
                                      .copyWith(
                                        color: AppColors.grayscale900,
                                      ),
                                ),
                              ],
                            ),
                          ),
                    );
                    Future.delayed(Duration(seconds: 5), () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  LoginPage(isRegister: false),
                        ),
                      );
                    });
                  }
                },
                buttonTitle: "إنشاء كلمة مرور جديدة",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
