import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/core/widgets/app_bar_widget.dart';
import 'package:friut_hub/features/e_commerce/favorites/presintation/bloc/favorites_bloc.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/pages/skeletonizer_product_grid.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/widgets/home_widgets/custom_item_card_widget.dart';

class FavoutiresPage extends StatelessWidget {
  static const routeName = "FavoutiresPage";
  const FavoutiresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(appBarTitle: "المفضلة"),
      body: BlocConsumer<FavoritesBloc, FavoritesState>(
        listener: (context, state) {
          if (state is FavoritesError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Error in favorites page at ${state.message}",
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is FavoritesLoading) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 8,
                    childAspectRatio: 176 / 214,
                  ),
              itemBuilder: (_, __) {
                return SkeletonProductCard();
              },
            );
          } else if (state is GotAllFavorites) {
            final products = state.products;
            if (products.isEmpty) {
              return Center(
                child: Text(
                  "لم تقم باضافة شيء للمفضلة ",
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length, //-7
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
          } else
            return Text("state in favorites page is: $state");
        },
      ),
    );
  }
}
