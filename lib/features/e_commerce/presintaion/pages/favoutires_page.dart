import 'package:flutter/material.dart';
import 'package:friut_hub/core/widgets/app_bar_widget.dart';

class FavoutiresPage extends StatelessWidget {
  static const routeName = "FavoutiresPage";
  const FavoutiresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(appBarTitle: "المفضلة"),
      body: const Placeholder());
  }
}
