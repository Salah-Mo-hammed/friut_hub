import 'package:flutter/material.dart';
import 'package:friut_hub/auth/presentation/pages/fprget_pass_page.dart';
import 'package:friut_hub/auth/presentation/pages/reset_pass_page.dart';
import 'package:friut_hub/auth/presentation/widgets/app_bar_widget.dart';
import 'package:friut_hub/auth/presentation/widgets/my_button_widget.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';

class PasswoedRecoveryPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _checkControllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _foucsNodes = List.generate(
    4,
    (_) => FocusNode(),
  );
  PasswoedRecoveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xFFF3F5F7),
        appBar: MyAppBar(appBarTitle: "التحقق من الرمز"),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              ForgetPasswordTexts(
                title:
                    "أدخل الرمز الذي أرسلناه إلى عنوان بريد التاليMaxxx@email.com",
              ),
              SizedBox(height: 29.h(context)),
              Row(
                children: List.generate(4, (index) {
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
                          (MediaQuery.sizeOf(context).width / 4) - 20,
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
                          if (value.isNotEmpty && index < 3) {
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
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    // ! go to NextPage OF forget password
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResetPasswordPage(),
                      ),
                    );
                  }
                },
                buttonTitle: "نسيت كلمة المرور",
              ),
              SizedBox(height: 24.h(context)),
              TextButton(
                onPressed: () {},
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
