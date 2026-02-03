// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/custom_search_bar_widget.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/home_widgets/custom_item_card_widget.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/products_widgets/filter_bottom_sheet_button_widget.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/products_widgets/products_app_bar_widget.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/products_widgets/products_horizntal_list_widget.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/products_widgets/products_row_widget.dart';

class ProductsPage extends StatelessWidget {
  TextEditingController minPriceController = TextEditingController(
    text: kDebugMode ? "500" : null,
  );
  TextEditingController maxPriceController = TextEditingController(
    text: kDebugMode ? "1500" : null,
  );

  ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F5F7),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 50.h(context))),
          SliverToBoxAdapter(child: ProductsAppBar()),
          SliverToBoxAdapter(child: CustomSearchBarWidget()),
          SliverToBoxAdapter(child: SizedBox(height: 10.h(context))),
          SliverToBoxAdapter(
            child: ProductRow(
              text1: "منتجاتنا",
              widget2: FilterBottomSheetButton(
                minPriceController: minPriceController,
                maxPriceController: maxPriceController,
              ),
            ),
          ),
          SliverToBoxAdapter(child: ProductsHorizntalList()),
          SliverToBoxAdapter(
            child: ProductRow(
              text1: "الأكثر مبيعًا",
              widget2: Text("المزيد", style: AppTextStyles.bodySmall),
            ),
          ),
          SliverGrid.builder(
            itemCount: 10,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: .9,
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
