import 'package:flutter/material.dart';
import 'package:friut_hub/core/widgets/app_bar_widget.dart';

class PaymentsPage extends StatelessWidget {
  static const routeName = "PaymentsPage";
  const PaymentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(appBarTitle: "المدفوعات"),
      body: const Placeholder());
  }
}
