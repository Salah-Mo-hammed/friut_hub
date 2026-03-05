import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/features/e_commerce/category/presintation/bloc/category_bloc.dart';
import 'package:friut_hub/features/e_commerce/products/presintation/blocs/products_bloc/products_bloc.dart';
import 'package:friut_hub/generated/assets.dart';

class ProductsHorizntalList extends StatefulWidget {
  const ProductsHorizntalList({super.key});

  @override
  State<ProductsHorizntalList> createState() =>
      _ProductsHorizntalListState();
}

class _ProductsHorizntalListState
    extends State<ProductsHorizntalList> {
  List localCategoryImages = [
    Assets.svgFruits,
    Assets.svgVegetables,
    Assets.svgJuice,
    Assets.svgDairy,
    Assets.svgBread,
    Assets.svgSeeds,
    Assets.svgHerb,
  ];
  @override
  void initState() {
    context.read<CategoryBloc>().add(GetAllCategoriesEvent());

    super.initState();
  }

  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryBloc, CategoryState>(
      listener: (context, state) {
        if (state is CategoryError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const SizedBox(
            height: 120,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is CategoriesLoaded) {
          return SizedBox(
            height: 120.h(context),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                final category = state.categories[index];
                final isSelected = _selectedIndex == index;

                return GestureDetector(
                  onTap: () {
                    if (_selectedIndex == index) {
                      // deselect
                      setState(() => _selectedIndex = -1);
                      context.read<ProductsBloc>().add(
                        GetAllProductsEvent(),
                      );
                    } else {
                      // select
                      setState(() => _selectedIndex = index);
                      context.read<ProductsBloc>().add(
                        GetProductsByCategoryEvent(category.id),
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                isSelected
                                    ? Border.all(
                                      color: AppColors.green1_600,
                                      width: 2,
                                    )
                                    : null,
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 39,
                            child: SvgPicture.asset(
                              localCategoryImages[index], // adjust to your entity field
                              height: 45.h(context),
                              width: 45.w(context),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h(context)),
                        Text(
                          category.name,
                          style: AppTextStyles.bodySmallBold.copyWith(
                            color:
                                isSelected
                                    ? AppColors.green1_500
                                    : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
