import 'package:flutter/material.dart';
import 'package:friut_hub/core/widgets/app_bar_widget.dart';

class AboutUsPage extends StatelessWidget {
  static const routeName = "AboutUsPage";
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(appBarTitle: "من نحن"),
      body: const Placeholder());
  }
}
