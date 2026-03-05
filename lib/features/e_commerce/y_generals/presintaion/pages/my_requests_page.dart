import 'package:flutter/material.dart';
import 'package:friut_hub/core/widgets/app_bar_widget.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/widgets/profile_widgets/expandable_order_item.dart';

class MyRequestsPage extends StatelessWidget {
  static const routeName = "MyRequestsPage";
  const MyRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(appBarTitle: "طلباتي"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: const [
            ExpandableOrderItem(),
            SizedBox(height: 10),
            ExpandableOrderItem(),
            SizedBox(height: 10),
            ExpandableOrderItem(),
          ],
        ),
      ),
    );
  }
}

