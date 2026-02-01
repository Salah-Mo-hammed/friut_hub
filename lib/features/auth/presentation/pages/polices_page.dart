import 'package:flutter/material.dart';
import 'package:friut_hub/core/widgets/app_bar_widget.dart';

class PolicesPage extends StatelessWidget {
  const PolicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(appBarTitle: "الشروط والأحكام"),
      body: Center(child: Text("الشروط والأحكام الخاصة بنا")),
    );
  }
}
