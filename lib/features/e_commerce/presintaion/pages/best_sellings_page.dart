import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friut_hub/core/widgets/app_bar_widget.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/home_widgets/custom_item_card_widget.dart';
import 'package:friut_hub/features/e_commerce/products/presintation/blocs/bloc/products_bloc.dart';

class BestSellingsPage extends StatelessWidget {
  const BestSellingsPage({super.key});
  static const routeName = 'BestSellings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(appBarTitle: "الأكثر مبيعًا"),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                if (state is ProductsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is ProductError) {
                  return Center(child: Text(state.message));
                }

                if (state is ProductsLoaded) {
                  final products = state.products;

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 8,
                          childAspectRatio: 176 / 214,
                        ),
                    itemBuilder: (context, index) {
                      final product = products[index];

                      return CustomItemCardWidget(product: product);
                    },
                  );
                }

                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
