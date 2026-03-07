// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/core/widgets/app_bar_widget.dart';
import 'package:friut_hub/core/widgets/my_button_widget.dart';
import 'package:friut_hub/features/auth/presentation/widgets/password_feild_widget.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/widgets/profile_widgets/personal_info_text_feild.dart';

class PersonalProfilePage extends StatelessWidget {
  String userName;
  String useremail;
  static const routeName = "PersonalProfilePage";
  PersonalProfilePage({
    super.key,
    required this.userName,
    required this.useremail,
  });

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController currentPassController =
      TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(appBarTitle: "الملف الشخصي"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Text(
                "المعلومات الشخصيه",
                style: AppTextStyles.bodyBaseBold.copyWith(
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 8),
            PersonalInfoTextFeild(
              hintLabel: userName,
              isPassword: false,
              controller: nameController,
            ),

            SizedBox(height: 8),
            PersonalInfoTextFeild(
              hintLabel: useremail,
              isPassword: false,
              controller: emailController,
            ),
            SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Text(
                "تغيير كلمة المرور",
                style: AppTextStyles.bodyBaseBold.copyWith(
                  color: Colors.black,
                ),
              ),
            ),

            SizedBox(height: 8),
            PasswordField(
              controller: currentPassController,
              validator: (String? p1) {
                return null;
              },
              hint: 'كلمة المرور الحالي',
            ),

            SizedBox(height: 8),
            PasswordField(
              controller: newPassController,
              validator: (String? p1) {
                return null;
              },
              hint: 'كلمة المرور الجديده',
            ),

            SizedBox(height: 8),
            PasswordField(
              controller: confirmPassController,
              validator: (String? p1) {
                return null;
              },
              hint: 'تأكيد كلمة المرور الجديده',
            ),

            SizedBox(height: 86),
            MyButton(
              onTap: () {
                if (nameController.text != userName) {
                  // call event patch (update user's name)
                  print("done name");
                }

                if (newPassController.text.isNotEmpty) {
                  if (newPassController.text !=
                      currentPassController.text) {
                    if (newPassController.text ==
                        confirmPassController.text) {
                      print("done pass");
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "كلمة المرور الجديدة غير متطابقة",
                          ),
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "كلمة المرور الجديدة يجب أن تختلف عن القديمة",
                        ),
                      ),
                    );
                  }
                }
                //Navigator.pop(context);
              },
              content: Text(
                "حفظ التغييرات",
                style: AppTextStyles.bodyBaseBold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
