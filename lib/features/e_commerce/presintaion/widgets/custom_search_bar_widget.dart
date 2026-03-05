import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/features/e_commerce/products/presintation/blocs/products_bloc/products_bloc.dart';
import 'package:friut_hub/generated/assets.dart';

class CustomSearchBarWidget extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  CustomSearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        width: 343.w(context),
        child: TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: "ابحث عن.......",
            hintStyle: AppTextStyles.bodySmall,
            border: InputBorder.none,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(7.0),
              child: GestureDetector(
                onTap: () {
                  context.read<ProductsBloc>().add(
                    SearchProductsEvent(searchController.text),
                  );
                },
                child: SvgPicture.asset(
                  Assets.svgSearchNormal,
                  height: 30,
                  width: 30,
                ),
              ),
            ),
            prefixIconConstraints: BoxConstraints(
              maxHeight: 40,
              maxWidth: 40,
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(7.0),
              child: SvgPicture.asset(
                Assets.svgFilterNormal,
                height: 30,
                width: 30,
              ),
            ),
            suffixIconConstraints: BoxConstraints(
              maxHeight: 40,
              maxWidth: 40,
            ),
          ),
        ),
      ),
    );
  }
}
