// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/features/e_commerce/cart/domain/entities/cart_item_entity.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/widgets/product_details_widgets/item_quantity_widget.dart';
import 'package:friut_hub/generated/assets.dart';

class ProductsInCartRow extends StatelessWidget {
  CartItemEntity item;
  ProductsInCartRow({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 93.w(context),
                  height: 112.h(context),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Image.asset(
                    Assets.pngWatermellonPng,
                    width: 73.w(context),
                    height: 60.h(context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.productName,
                        style: AppTextStyles.bodySmallBold.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),

                      Text(
                        "${item.quantity.toString()} كم",
                        style: AppTextStyles.bodySmallBold.copyWith(
                          fontSize: 15,
                          color: AppColors.orange500,
                        ),
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        height: 35,
                        child: ItemQuantityWidget(
                          onQuantityChanged: (valaue) {},
                          initialQuantity: item.quantity,
                          maxQuantity: 100,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 112.h(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(Assets.svgTrash),
                Text(
                  "${item.subTotal} جنيه ",
                  style: AppTextStyles.bodyBaseBold.copyWith(
                    fontSize: 16,
                    color: AppColors.orange500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
