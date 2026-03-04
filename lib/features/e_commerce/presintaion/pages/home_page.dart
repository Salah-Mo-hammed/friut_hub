import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/home_widgets/best_selling_bar_widget.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/home_widgets/custom_item_card_widget.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/custom_search_bar_widget.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/home_widgets/discount_banner_widget.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/home_widgets/main_dash_app_bar.dart';
import 'package:friut_hub/features/e_commerce/products/presintation/blocs/bloc/products_bloc.dart';
import 'package:friut_hub/generated/assets.dart';

class HomePage extends StatelessWidget {
  String userFullName;

  // bool noSearchResult = false;
  final discountImages = [
    Assets.pngDiscountImage1,
    Assets.pngDicountImage2,
    Assets.pngDicountImage3,
  ];

  HomePage({super.key, required this.userFullName});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: SizedBox(height: 40.h(context))),
        //! AppBar Row
        // ! Note: we didnt use MyAppBar here because there is somechanges in it here
        SliverToBoxAdapter(
          child: MainDashboardAppBarWidget(
            userFullName: userFullName,
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 16.h(context))),
        SliverToBoxAdapter(child: CustomSearchBarWidget()),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        // if (!noSearchResult) ...[
        SliverToBoxAdapter(
          child: SizedBox(
            height: 160.h(context),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: discountImages.length,
              padding: EdgeInsets.symmetric(horizontal: 4.w(context)),

              itemBuilder: (context, index) {
                return DiscountBanner(
                  discountImage: discountImages[index],
                );
              },
            ),
          ),
        ),

        SliverToBoxAdapter(child: MainBestSellingWIdget()),
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
                  itemCount: products.length - 7,
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
        // SliverGrid.builder(
        //   itemCount: 10,
        //   gridDelegate:
        //       const SliverGridDelegateWithFixedCrossAxisCount(
        //         crossAxisCount: 2,
        //         crossAxisSpacing: 16,
        //         mainAxisSpacing: 8,
        //         childAspectRatio: 176 / 214,
        //       ),
        //   itemBuilder: (context, index) {
        //     return CustomItemCardWidget();
        //   },
        // ),
        // ] else ...[
        //   //! noSearchResult contd
        //   SliverToBoxAdapter(child: SizedBox(height: 140.h(context))),

        //   SliverToBoxAdapter(
        //     child: SvgPicture.asset(Assets.svgNoResult),
        //   ),
        //   SliverToBoxAdapter(child: SizedBox(height: 20.h(context))),
        //   SliverToBoxAdapter(
        //     child: Text(
        //       "البحث",
        //       style: AppTextStyles.bodyBaseBold.copyWith(
        //         color: AppColors.grayscale600,
        //       ),
        //     ),
        //   ),
        //   SliverToBoxAdapter(child: SizedBox(height: 20.h(context))),
        //   SliverToBoxAdapter(
        //     child: Text(
        //       "عفوًا... هذه المعلومات غير متوفرة للحظة",
        //       style: AppTextStyles.bodyBaseBold.copyWith(
        //         color: AppColors.grayscale400,
        //       ),
        //     ),
        //   ),
        // ],
      ],
    );
  }
}
