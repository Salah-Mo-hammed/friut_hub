// ! there is a problem (fill password , then click on show password , it wont be printed)
import 'package:flutter/material.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/features/widgets/password_feild.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController =
      TextEditingController();
  final TextEditingController passwordController =
      TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // there is a problem in locale in main , arabic not working right, temp sol
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("تسجيل الدخول", style: AppTextStyles.bodyLarge),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
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
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
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
              SizedBox(height: 30),
              //* Button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 400,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.green1_500,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        // All fields are valid → ready for backend
                        print(
                          '\x1B[32mEmail: ${emailController.text}\x1B[0m',
                        );
                        print(
                          '\x1B[32mEmail: ${passwordController.text}\x1B[0m',
                        );
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => LoginPage(),
                        //   ),
                        // );
                      }
                    },
                    child: Center(
                      child: Text(
                        "تسجيل دخول",
                        style: AppTextStyles.bodyBaseBold,
                      ),
                    ),
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
