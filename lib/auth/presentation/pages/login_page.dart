// ! there is a problem (fill password , then click on show password , it wont be printed)
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:friut_hub/auth/presentation/pages/fprget_pass_page.dart';
import 'package:friut_hub/auth/presentation/pages/home_page.dart';
import 'package:friut_hub/auth/presentation/pages/register_page.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/features/widgets/password_feild_widget.dart';
import 'package:friut_hub/generated/assets.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController =
      TextEditingController();
  final TextEditingController passwordController =
      TextEditingController();
  bool isRegister;
  TextEditingController nameController = TextEditingController();

  LoginPage({super.key, required this.isRegister});

  @override
  Widget build(BuildContext context) {
    // there is a problem in locale in main , arabic not working right, temp sol
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
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
                        maxWidth:
                            MediaQuery.sizeOf(context).width - 50,
                      ),
                      child: RichTextWidget(
                        title1:
                            'من خلال إنشاء حساب ، فإنك توافق على ',
                        title2: 'الشروط والأحكام الخاصة بنا',
                        onTap: () {
                          // ! Polices page
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
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  //! in forget password , go to forget password
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              ForgetPasswordPage(),
                                    ),
                                  );
                                },
                          text: 'نسيت كلمة السر؟',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.green1_600,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              isRegister
                  ? SizedBox(height: 30)
                  : SizedBox(height: 33),
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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => isRegister?LoginPage() // Note: you can do register then sign in and also go HomePage
                    // :HomePage(),
                    //   ),
                    // );
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        LoginPage(isRegister: true),
                              ),
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
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  // final GlobalKey<FormState> _formKey;
  final String buttonTitle;
  void Function()? onTap;
  MyButton({
    super.key,
    required this.onTap,
    required this.buttonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 400,
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.green1_500,
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Text(
              buttonTitle,
              style: AppTextStyles.bodyBaseBold,
            ),
          ),
        ),
      ),
    );
  }
}

//! still need improvments , how to check that its true , this is a seperated widget
class PoliciesCheckBox extends StatefulWidget {
  bool checkboxValeu = false;
  PoliciesCheckBox({super.key});

  @override
  State<PoliciesCheckBox> createState() => _PoliciesCheckBoxState();
}

class _PoliciesCheckBoxState extends State<PoliciesCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(5),
      ),
      activeColor: AppColors.green1_500,
      value: widget.checkboxValeu,
      onChanged: (value) {
        setState(() {
          widget.checkboxValeu = !widget.checkboxValeu;
          //* or
          // widget.checkboxValeu = value!;
        });
      },
    );
  }
}

//! Note: this appbar will appear alot of times with some changes , so better to use switch and case (payments , searchs ,notifications )
// ! they are all have the same leading (back arrow to pop) , differece is title and some of pages will have 1 action , so better to use ENUM and switch cases
// ! so evrytime you build a new page , you will modify this widget by adding switch case and enum
class MyAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  final String appBarTitle;

  const MyAppBar({super.key, required this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Color(0xFFF1F1F5)),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
      ),
      centerTitle: true,
      title: Text(
        appBarTitle,
        style: AppTextStyles.bodyLarge.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class RichTextWidget extends StatelessWidget {
  String title1;
  String title2;
  void Function()? onTap;
  RichTextWidget({
    super.key,
    required this.title1,
    required this.title2,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: title1,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.grayscale600,

              fontSize: 15,
            ),
          ),
          TextSpan(
            //! recognizer as gesture detector , but with some changes
            recognizer: TapGestureRecognizer()..onTap = onTap,

            //() {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => RegisterPage(),
            //     ),
            //   );
            // },
            text: title2,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.green1_500,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

class OtherSignInButton extends StatelessWidget {
  final String title;
  final String iconSvgPath;
  final void Function()? onTap;
  const OtherSignInButton({
    super.key,
    required this.title,
    required this.iconSvgPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 340.w(context),
          height: 56.h(context),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grayscale300),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(),
              Text(
                title,
                style: AppTextStyles.bodyBaseBold.copyWith(
                  color: Colors.black,
                ),
              ),
              SvgPicture.asset(iconSvgPath),
              // SignInButton(Buttons.google, onPressed: (){})
              // FaIcon(FontAwesomeIcons.google, color: Colors.red),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class BuildTextFormFeild extends StatefulWidget {
  final String hintLabel;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  bool obscureText;
  final TextInputType keyboardType;

  BuildTextFormFeild({
    super.key,
    required this.hintLabel,
    required this.controller,
    required this.validator,
    required this.obscureText,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<BuildTextFormFeild> createState() =>
      _BuildTextFormFeildState();
}

class _BuildTextFormFeildState extends State<BuildTextFormFeild> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTextStyles.bodyBaseBold.copyWith(color: Colors.black),
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      autofillHints:
          widget.obscureText
              ? [AutofillHints.password]
              : [AutofillHints.email],
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.grayscale50,
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            width: 0.3,
            color: AppColors.grayscale400,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        hintText: widget.hintLabel,
        hintStyle: AppTextStyles.bodySmallBold.copyWith(
          color: AppColors.grayscale400,
          fontWeight: FontWeight.bold,
        ),
        // ✅ Show/hide icon
        suffixIcon:
            widget.obscureText
                ? IconButton(
                  icon: Icon(
                    widget.obscureText
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.grey[600],
                  ),
                  onPressed: () {
                    setState(() {
                      widget.obscureText =
                          !widget.obscureText; // toggle visibility
                    });
                  },
                )
                : null,
      ),
    );
  }
}

// ! my code
// class BuildTextFormFeild extends StatelessWidget {
//   String hintLabel;
//   TextEditingController controller;
//   final String? Function(String?)? validator;
//   bool obscureText;
//   BuildTextFormFeild({
//     super.key,
//     required this.hintLabel,
//     required this.controller,
//     required this.validator,
//      this.obscureText=false
//   });

//   @override
//   Widget build(BuildContext context) {
//     bool isEmail = hintLabel.contains("البريد الالكتروني");
//     return TextFormField(
//       keyboardType:
//           isEmail ? TextInputType.emailAddress : TextInputType.none,
//       obscureText: obscureText,
//       autofillHints:
//           isEmail ? [AutofillHints.email] : [AutofillHints.password],
//       controller: controller,
//       validator: validator,
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: AppColors.grayscale50,
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(5),
//           borderSide: BorderSide(
//             width: 0.3,
//             color: AppColors.grayscale400,
//           ),
//         ),
//         contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
//         hint: Text(
//           hintLabel,
//           style: AppTextStyles.bodySmallBold.copyWith(
//             color: AppColors.grayscale400,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }
