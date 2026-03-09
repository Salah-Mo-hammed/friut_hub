import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/pages/item_details_page.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/widgets/home_widgets/add_icon.dart';
import 'package:friut_hub/features/e_commerce/products/domain/entities/product_entity.dart';
import 'package:friut_hub/features/e_commerce/products/presintation/blocs/product_details_bloc/product_details_bloc.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/widgets/home_widgets/favourite_icon_widget.dart';
import 'package:friut_hub/generated/assets.dart';

class CustomItemCardWidget extends StatelessWidget {
  final ProductEntity product;
  const CustomItemCardWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Stack(
        children: [
          Positioned(
            top: 20,
            right: 20,
            child: FavouriteIconWidget(product: product,),
          ),
          Positioned(
            top: 20,
            right: 40,
            child: Image.asset(
              height: 120,
              width: 120,
              Assets.pngFruitBasketAmico1Splash1,
            ),
          ),
          // ! same problem
          // Center(
          // child: SvgPicture.asset(Assets.svgFarawlla),
          // ),
          Positioned(
            bottom: 20,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name, //"بطيخ",
                  style: AppTextStyles.bodySmallBold.copyWith(
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "${product.price} جنية / ",
                      style: AppTextStyles.bodySmallBold.copyWith(
                        fontSize: 15,
                        color: AppColors.orange500,
                      ),
                    ),
                    Text(
                      "الكيلو",
                      style: AppTextStyles.bodySmallBold.copyWith(
                        fontSize: 15,
                        color: AppColors.orange300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            child: ItemAddIcon(
              onTap: () {
                context.read<ProductDetailsBloc>().add(
                  GetProductByIdEvent(product.id),
                );
                Navigator.pushNamed(
                  context,
                  ItemDetailsPage.routeName,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
