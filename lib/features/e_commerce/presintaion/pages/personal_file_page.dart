import 'package:flutter/material.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/core/widgets/app_bar_widget.dart';
import 'package:friut_hub/core/widgets/my_button_widget.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/profile_widgets/personal_info_text_feild.dart';

class PersonalProfilePage extends StatelessWidget {
  static const routeName = "PersonalProfilePage";
  const PersonalProfilePage({super.key});

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
              hintLabel: "أحمد ياسر",
              isPassword: false,
            ),

            SizedBox(height: 8),
            PersonalInfoTextFeild(
              hintLabel: "mail@mail.com",
              isPassword: false,
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
            PersonalInfoTextFeild(
              hintLabel: "كلمة المرور الحالي",
              isPassword: true,
            ),

            SizedBox(height: 8),
            PersonalInfoTextFeild(
              hintLabel: "كلمة المرور الجديده",
              isPassword: true,
            ),
            SizedBox(height: 8),
            PersonalInfoTextFeild(
              hintLabel: "تأكيد كلمة المرور الجديده",
              isPassword: true,
            ),
            SizedBox(height: 86),
            MyButton(onTap: () {}, content:
                          Text( "حفظ التغييرات", style: AppTextStyles.bodyBaseBold),

             
             
             ),
          ],
        ),
      ),
    );
  }
}
