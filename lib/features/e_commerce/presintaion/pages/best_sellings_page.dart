import 'package:flutter/material.dart';
import 'package:friut_hub/core/widgets/app_bar_widget.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/home_widgets/custom_item_card_widget.dart';

class BestSellingsPage extends StatelessWidget {
  const BestSellingsPage({super.key});
  static const routeName = 'BestSellings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(appBarTitle: "الأكثر مبيعًا"),
      body: CustomScrollView(
        slivers: [
          SliverGrid.builder(
            itemCount: 10,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 8,
                  childAspectRatio: 176 / 214,
                ),
            itemBuilder: (context, index) {
              return CustomItemCardWidget();
            },
          ),
        ],
      ),
    );
  }
}
