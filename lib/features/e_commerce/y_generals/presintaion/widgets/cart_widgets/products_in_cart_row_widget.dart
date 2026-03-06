// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/features/e_commerce/cart/domain/entities/cart_item_entity.dart';
import 'package:friut_hub/features/e_commerce/cart/presintation/bloc/cart_bloc.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/widgets/product_details_widgets/item_quantity_widget.dart';
import 'package:friut_hub/generated/assets.dart';

class ProductsInCartRow extends StatefulWidget {
  final CartItemEntity item;
  final ValueChanged<int> onQuantityChanged;

  const ProductsInCartRow({
    super.key,
    required this.item,
    required this.onQuantityChanged,
  });

  @override
  State<ProductsInCartRow> createState() => _ProductsInCartRowState();
}

class _ProductsInCartRowState extends State<ProductsInCartRow> {
  late double itemSubTotalPrice;
  late int itemQuantity;

  @override
  void initState() {
    super.initState();
    itemQuantity = widget.item.quantity;
    itemSubTotalPrice = widget.item.price * widget.item.quantity;
  }

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
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
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
                        widget.item.productName,
                        style: AppTextStyles.bodySmallBold.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "عدد:  $itemQuantity",
                        style: AppTextStyles.bodySmallBold.copyWith(
                          fontSize: 15,
                          color: AppColors.orange500,
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        height: 35,
                        child: ItemQuantityWidget(
                          initialQuantity: widget.item.quantity,
                          maxQuantity: 100,
                          onQuantityChanged: (newQuantity) {
                            setState(() {
                              itemQuantity = newQuantity;
                              itemSubTotalPrice =
                                  widget.item.price * newQuantity;
                            });
                            widget.onQuantityChanged(
                              newQuantity,
                            ); // 👈 notify parent
                          },
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
                GestureDetector(
                  onTap: () {
                    // context.read<CartBloc>().add(
                    // RemoveFromCartEvent(productId: widget.item.productId),
                    // );
                  },
                  child: SvgPicture.asset(Assets.svgTrash),
                ),
                Text(
                  "${itemSubTotalPrice.toStringAsFixed(0)} جنيه",
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

// ! old code ver 2 (6/3/2026)
/*
class ProductsInCartRow extends StatefulWidget {
  CartItemEntity item;
  final ValueChanged<double> onSubPriceChanged;
  ProductsInCartRow({
    super.key,
    required this.item,
    required this.onSubPriceChanged,
  });

  @override
  State<ProductsInCartRow> createState() => _ProductsInCartRowState();
}

class _ProductsInCartRowState extends State<ProductsInCartRow> {
  late double itemSubTotalPrice;
  late int itemQuantity;

  @override
  void initState() {
    super.initState();
    itemSubTotalPrice = widget.item.price * widget.item.quantity;
    itemQuantity = widget.item.quantity;
  }

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
                        widget.item.productName,
                        style: AppTextStyles.bodySmallBold.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),

                      Text(
                        "عدد:  $itemQuantity ",
                        style: AppTextStyles.bodySmallBold.copyWith(
                          fontSize: 15,
                          color: AppColors.orange500,
                        ),
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        height: 35,
                        child: ItemQuantityWidget(
                          onQuantityChanged: (itemQuantityValue) {
                            setState(() {
                              itemQuantity = itemQuantityValue;
                              itemSubTotalPrice =
                                  widget.item.price * itemQuantity;
                            //  to take the subprice and send it back to cart page
                             widget.onSubPriceChanged(itemSubTotalPrice);
                            });
                          },
                          initialQuantity: widget.item.quantity,
                          // ! maxQuantity  should be item.stock (call backend fev to add it)
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
                  "$itemSubTotalPrice جنيه ",
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
 */
// ! old code

// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';

// import 'package:friut_hub/core/colors/app_colors.dart';
// import 'package:friut_hub/core/extentions/num_extenstions.dart';
// import 'package:friut_hub/core/fonts/fonts_class.dart';
// import 'package:friut_hub/features/e_commerce/cart/domain/entities/cart_item_entity.dart';
// import 'package:friut_hub/features/e_commerce/cart/presintation/bloc/cart_bloc.dart';
// import 'package:friut_hub/features/e_commerce/y_generals/presintaion/widgets/product_details_widgets/item_quantity_widget.dart';
// import 'package:friut_hub/generated/assets.dart';

// class ProductsInCartRow extends StatelessWidget {
//   CartItemEntity item;
//   ProductsInCartRow({super.key, required this.item});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         children: [
//           Expanded(
//             child: Row(
//               children: [
//                 Container(
//                   width: 93.w(context),
//                   height: 112.h(context),
//                   decoration: BoxDecoration(color: Colors.white),
//                   child: Image.asset(
//                     Assets.pngWatermellonPng,
//                     width: 73.w(context),
//                     height: 60.h(context),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         item.productName,
//                         style: AppTextStyles.bodySmallBold.copyWith(
//                           color: Colors.black,
//                         ),
//                       ),
//                       SizedBox(height: 5),

//                       Text(
//                         "${item.quantity.toString()} كم",
//                         style: AppTextStyles.bodySmallBold.copyWith(
//                           fontSize: 15,
//                           color: AppColors.orange500,
//                         ),
//                       ),
//                       SizedBox(height: 15),
//                       SizedBox(
//                         height: 35,
//                         child: ItemQuantityWidget(
//                           onQuantityChanged: (newQuantity) {
//                         // this is not a very professional way , but its good
//                             context.read<CartBloc>().add(
//                               UpdateProductQInCartEvent(
//                                 productId: item.productId,
//                                 quantity: newQuantity,
//                               ),
//                             );
//                             context.read<CartBloc>().add(
//                               GetCartProductsEvent(),
//                             );
//                           },
//                           initialQuantity: item.quantity,
//                           maxQuantity: 100,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 112.h(context),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 SvgPicture.asset(Assets.svgTrash),
//                 Text(
//                   "${item.subTotal} جنيه ",
//                   style: AppTextStyles.bodyBaseBold.copyWith(
//                     fontSize: 16,
//                     color: AppColors.orange500,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
