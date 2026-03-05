import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/features/e_commerce/presintaion/pages/skeletonizer_product_grid.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/home_widgets/best_selling_bar_widget.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/home_widgets/custom_item_card_widget.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/custom_search_bar_widget.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/home_widgets/discount_banner_widget.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/home_widgets/main_dash_app_bar.dart';
import 'package:friut_hub/features/e_commerce/products/presintation/blocs/products_bloc/products_bloc.dart';
import 'package:friut_hub/generated/assets.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
              }

              if (state is ProductError) {
                return Center(child: Text(state.message));
              }

              if (state is ProductsLoaded) {
                final products = state.products;
                if (products.isEmpty) {
                  return Column(
                    children: [
                      SvgPicture.asset(Assets.svgNoResult),
                      SizedBox(height: 20.h(context)),
                      Text(
                        "البحث",
                        style: AppTextStyles.bodyBaseBold.copyWith(
                          color: AppColors.grayscale600,
                        ),
                      ),
                      SizedBox(height: 20.h(context)),
                      Text(
                        "عفوًا... هذه المعلومات غير متوفرة للحظة",
                        style: AppTextStyles.bodyBaseBold.copyWith(
                          color: AppColors.grayscale400,
                        ),
                      ),
                    ],
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
              }

              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }
}
//! ANOTHER SHAPE FOR NO SEARCH RESULT (TAKE WHOLE SCREEN), AND DISCOUNT BANNER IS IN ProductLoaded
// ! Note: but with no loading skeleton , OK
/*
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
import 'package:friut_hub/features/e_commerce/products/presintation/blocs/products_bloc/products_bloc.dart';
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

        // SliverToBoxAdapter(
        //   child: SizedBox(
        //     height: 160.h(context),
        //     child: ListView.builder(
        //       scrollDirection: Axis.horizontal,
        //       itemCount: discountImages.length,
        //       padding: EdgeInsets.symmetric(horizontal: 4.w(context)),

        //       itemBuilder: (context, index) {
        //         return DiscountBanner(
        //           discountImage: discountImages[index],
        //         );
        //       },
        //     ),
        //   ),
        // ),
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
                if (products.isEmpty) {
                  return Column(
                    children: [
                      SizedBox(height: 140.h(context)),

                      SvgPicture.asset(Assets.svgNoResult),
                      SizedBox(height: 20.h(context)),
                      Text(
                        "البحث",
                        style: AppTextStyles.bodyBaseBold.copyWith(
                          color: AppColors.grayscale600,
                        ),
                      ),
                      SizedBox(height: 20.h(context)),
                      Text(
                        "عفوًا... هذه المعلومات غير متوفرة للحظة",
                        style: AppTextStyles.bodyBaseBold.copyWith(
                          color: AppColors.grayscale400,
                        ),
                      ),
                    ],
                  );
                }
                return Column(
                  children: [
                    SizedBox(
                      height: 160.h(context),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: discountImages.length,
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.w(context),
                        ),

                        itemBuilder: (context, index) {
                          return DiscountBanner(
                            discountImage: discountImages[index],
                          );
                        },
                      ),
                    ),
                    MainBestSellingWIdget(),

                    GridView.builder(
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
                    ),
                  ],
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }
}

 */