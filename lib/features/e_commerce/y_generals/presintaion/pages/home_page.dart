import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/widgets/home_widgets/discounts_container_widget.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/pages/skeletonizer_product_grid.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/widgets/home_widgets/best_selling_bar_widget.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/widgets/home_widgets/custom_item_card_widget.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/widgets/custom_search_bar_widget.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/widgets/home_widgets/main_dash_app_bar.dart';
import 'package:friut_hub/features/e_commerce/products/presintation/blocs/products_bloc/products_bloc.dart';
import 'package:friut_hub/generated/assets.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends StatelessWidget {
  final String userFullName;

  final discountImages = [
    Assets.pngDiscountImage1Png,
    Assets.pngDiscountImage2Png,
    Assets.pngDiscountImage1Png,
  ];
  final discountCircles = [
    Assets.svgDiscountLightGreenCircle1,
    Assets.svgDiscountDarkGreenCircle2,
    Assets.svgDiscountOrangeCircle3,
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
                      SizedBox(height: 170.h(context)),
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
                    state.didSearch
                        ? SizedBox()
                        : SizedBox(
                          height: 160.h(context),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: discountImages.length,
                            padding: EdgeInsets.symmetric(
                              horizontal: 4.w(context),
                            ),

                            itemBuilder: (context, index) {
                              return DiscountsContainerWidget(
                                image: discountImages[index],
                                circleImage: discountCircles[index],
                              );
                            },
                          ),
                        ),
                    state.didSearch
                        ? MainBestSellingWIdget(title: "نتائج البحث ")
                        : MainBestSellingWIdget(
                          title: "الأكثر مبيعًا",
                        ),

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
