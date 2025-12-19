import 'package:flutter/material.dart';
import 'package:friut_hub/auth/presentation/pages/login_page.dart';

class PolicesPage extends StatelessWidget {
  const PolicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: MyAppBar(appBarTitle: "الشروط والأحكام"),
        body: Center(child: Text("الشروط والأحكام الخاصة بنا")),
      ),
    );
  }
}
