// ! there is a problem (fill password , then click on show password , it wont be printed)
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/core/widgets/app_bar_widget.dart';
import 'package:friut_hub/core/widgets/checkbox_widget.dart';
import 'package:friut_hub/core/widgets/my_button_widget.dart';
import 'package:friut_hub/core/widgets/my_text_form_feild_widget.dart';
import 'package:friut_hub/core/widgets/rich_text_widget.dart';
import 'package:friut_hub/features/auth/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:friut_hub/features/auth/presentation/blocs/signup_bloc/signup_bloc.dart';
import 'package:friut_hub/features/auth/presentation/blocs/signup_bloc/signup_state.dart';
import 'package:friut_hub/features/auth/presentation/pages/fprget_pass_page.dart';
import 'package:friut_hub/features/auth/presentation/pages/pass_recovery_page.dart';
import 'package:friut_hub/features/auth/presentation/pages/polices_page.dart';
import 'package:friut_hub/features/auth/presentation/widgets/google_ios_button.dart';
import 'package:friut_hub/features/auth/presentation/widgets/password_feild_widget.dart';
import 'package:friut_hub/features/e_commerce/presintaion/pages/main_dashboard.dart';
import 'package:friut_hub/generated/assets.dart';

class LoginPage extends StatefulWidget {
  bool isRegister;

  LoginPage({super.key, required this.isRegister});

  static const routeName = '/LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController(
    text: kDebugMode ? "emailController@gmail.com" : null,
  );

  final TextEditingController passwordController =
      TextEditingController(
        text: kDebugMode ? "passwordController" : null,
      );

  TextEditingController fullNameController = TextEditingController(
    text: kDebugMode ? 'fullnameController' : null,
  );
  TextEditingController userNameController = TextEditingController(
    text: kDebugMode ? 'usernameController' : null,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        appBarTitle:
            !widget.isRegister ? "تسجيل الدخول" : "حساب جديد",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior:
              ScrollViewKeyboardDismissBehavior.onDrag,

          child: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (widget.isRegister) ...[
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: BuildTextFormFeild(
                        hintLabel: ' المستخدم الاسم',
                        controller: userNameController,
                        validator: (nameV) {
                          if (nameV == null || nameV.isEmpty) {
                            return "هذا الحقل مطلوب";
                          }
                          return null;
                        },
                        obscureText: false,
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: BuildTextFormFeild(
                        hintLabel: 'الاسم',
                        controller: fullNameController,
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
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

                  if (widget.isRegister) ...[
                    SizedBox(height: 16),
                    Row(
                      children: [
                        PoliciesCheckBox(
                          title: '',
                          validator: (checkbox) {
                            if (checkbox == null ||
                                checkbox == false) {
                              return "!";
                            }
                            return null;
                          },
                        ),
                        Container(
                          constraints: BoxConstraints(
                            maxWidth:
                                MediaQuery.sizeOf(context).width - 50,
                          ),
                          child: RichTextWidget(
                            title1:
                                'من خلال إنشاء حساب ، فإنك توافق على ',
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25.0,
                      ),
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
                  widget.isRegister
                      ? SizedBox(height: 30)
                      : SizedBox(height: 33),

                  //* Button
                  widget.isRegister
                      ? BlocConsumer<SignupBloc, SignupState>(
                        listener: (context, state) {
                          if (state is SignupSucsses) {
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(
                              SnackBar(
                                content: Text("Register Sucessful"),
                              ),
                            );
                            context.read<SignupBloc>().add(
                              sendEmailConfirmationCodeEvent(
                                email: emailController.text,
                              ),
                            );
                            Navigator.pushNamed(
                              context,
                              PasswoedRecoveryPage.routeName,
                              arguments: {
                                "isForEmailConfirmation": true,
                                "email": emailController.text,
                              },
                            );
                          }

                          if (state is SignupFailure) {
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(
                              SnackBar(content: Text(state.message)),
                            );
                          }
                        },
                        builder: (context, state) {
                          return MyButton(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<SignupBloc>().add(
                                  SignupSubmittedEvent(
                                    userName: userNameController.text,
                                    fullName: fullNameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ),
                                );
                              }
                            },
                            content: Text(
                              "إنشاء حساب جديد",
                              style: AppTextStyles.bodyBaseBold,
                            ),
                          );
                        },
                      )
                      : BlocConsumer<LoginBloc, LoginState>(
                        listener: (context, state) {
                          if (state is LoginSucessful) {
                            print(
                              "response from sucessful login is ${state.loggedUserData} ",
                            );
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(
                              SnackBar(
                                content: Text("Login Sucessful"),
                              ),
                            );

                            Navigator.pushReplacementNamed(
                              context,
                              MainDashboard.routeName,
                              arguments: state.loggedUserData
                            );
                          }

                          if (state is LoginFailure) {
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(
                              SnackBar(content: Text(state.message)),
                            );
                          }
                        },
                        builder: (context, state) {
                          return MyButton(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<LoginBloc>().add(
                                  LoginSubmittedEvent(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ),
                                );
                              }
                            },
                            content: Text(
                              "تسجيل دخول",
                              style: AppTextStyles.bodyBaseBold,
                            ),
                          );
                        },
                      ),
                  SizedBox(height: 33.h(context)),
                  //!  ======================== No Account?
                  Center(
                    child:
                        widget.isRegister
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
                  if (!widget.isRegister) ...[
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
                            style: AppTextStyles.bodyBaseBold
                                .copyWith(color: Colors.black),
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
          ),
        ),
      ),
    );
  }
}
