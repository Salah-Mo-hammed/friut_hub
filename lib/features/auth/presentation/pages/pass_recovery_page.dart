import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/core/widgets/app_bar_widget.dart';
import 'package:friut_hub/core/widgets/my_button_widget.dart';
import 'package:friut_hub/features/auth/presentation/blocs/forget_pass_bloc/forget_pass_bloc.dart';
import 'package:friut_hub/features/auth/presentation/blocs/signup_bloc/signup_bloc.dart';
import 'package:friut_hub/features/auth/presentation/blocs/signup_bloc/signup_state.dart';
import 'package:friut_hub/features/auth/presentation/pages/login_page.dart';
import 'package:friut_hub/features/auth/presentation/pages/reset_pass_page.dart';
import 'package:friut_hub/features/auth/presentation/widgets/forget_pass_texts_widget.dart';

class PasswoedRecoveryPage extends StatelessWidget {
  final bool isForEmailConfirmation;
  final String email;
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _checkControllers = List.generate(
    6,
    (_) => TextEditingController(
      // text: kDebugMode ? "_checkController" : null,
    ),
  );
  final List<FocusNode> _foucsNodes = List.generate(
    6,
    (_) => FocusNode(),
  );
  PasswoedRecoveryPage({
    super.key,
    required this.isForEmailConfirmation,
    required this.email,
  });

  static const routeName = 'PasswoedRecovery';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F5F7),
      appBar: MyAppBar(
        appBarTitle:
            !isForEmailConfirmation
                ? "التحقق من الرمز"
                : "تاكيد الكود الايميل",
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<SignupBloc, SignupState>(
            listener: (context, state) {
              if (state is SignupLoading) {
                // show loading
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder:
                      (_) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                );
              }

              if (state is EmailVerifiedSucessfully) {
                Navigator.pop(context); // close loading

                !isForEmailConfirmation
                    ? Navigator.pushNamed(
                      context,
                      ResetPasswordPage.routeName,
                    )
                    : Navigator.pushReplacementNamed(
                      context,
                      LoginPage.routeName,
                    );
              }

              if (state is SignupFailure) {
                Navigator.pop(context); // close loading

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
          ),
          BlocListener<ForgetPassBloc, ForgetPassState>(
            listener: (context, state) {
              print(state);
              if (state is ForgetPassLoading) {
                // show loading
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder:
                      (_) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                );
              }

              if (state is PasswordOtpCorrect) {
                Navigator.pop(context); // close loading
                print(state.resetToken);
                !isForEmailConfirmation
                    ? Navigator.pushNamed(
                      context,
                      ResetPasswordPage.routeName,
                      arguments: state.resetToken,
                    )
                    : Navigator.pushReplacementNamed(
                      context,
                      LoginPage.routeName,
                    );
              }

              if (state is ForgetPassFailure) {
                Navigator.pop(context); // close loading

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
          ),
        ],
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ForgetPasswordTexts(
                title:
                    "أدخل الرمز الذي أرسلناه إلى عنوان بريد التالي //",
              ),
              SizedBox(height: 29.h(context)),
              Row(
                children: List.generate(6, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      width:
                          (MediaQuery.sizeOf(context).width / 6) - 20,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        controller: _checkControllers[index],
                        focusNode: _foucsNodes[index],
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        style: TextStyle(fontSize: 24),
                        decoration: InputDecoration(
                          counterText: "",
                          // ! to hide line under texts
                          // border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'فارغ';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          if (value.isNotEmpty && index < 5) {
                            _foucsNodes[index + 1].requestFocus();
                          }
                          if (value.isEmpty && index > 0) {
                            _foucsNodes[index - 1].requestFocus();
                          }
                        },
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 29.h(context)),
              MyButton(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {

                    final otpCode =
                        _checkControllers
                            .map((controller) => controller.text)
                            .join();
                    print(otpCode);
                    if (isForEmailConfirmation) {
                      context.read<SignupBloc>().add(
                        VerifyEmailOTPEvent(
                          email: email,
                          otp: otpCode,
                        ),
                      );
                    } else if (!isForEmailConfirmation) {
                      context.read<ForgetPassBloc>().add(
                        VerifyPassOTPEvent(
                          email: email,
                          otp: otpCode,
                        ),
                      );
                    }
                  }
                },
                content: Text(
                  !isForEmailConfirmation
                      ? "نسيت كلمة المرور"
                      : "تاكيد الايميل",
                  style: AppTextStyles.bodyBaseBold,
                ),
              ),
              SizedBox(height: 24.h(context)),
              TextButton(
                onPressed: () {
                  isForEmailConfirmation
                      ? context.read<SignupBloc>().add(
                        sendEmailConfirmationCodeEvent(email: email),
                      )
                      : context.read<ForgetPassBloc>().add(
                        ResetPasswordEvent(email: email),
                      );
                },
                child: Text(
                  "إعادة إرسال الرمز",
                  style: AppTextStyles.bodyBaseBold.copyWith(
                    color: AppColors.green1_600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
