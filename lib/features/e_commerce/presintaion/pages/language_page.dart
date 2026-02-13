import 'package:flutter/material.dart';
import 'package:friut_hub/core/widgets/app_bar_widget.dart';

class LanguagePage extends StatelessWidget {
  static const routeName = 'LanguagePage';
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(appBarTitle: "اللغة"),
      body: const Placeholder());
  }
}
