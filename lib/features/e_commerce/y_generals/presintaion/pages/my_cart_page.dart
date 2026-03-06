import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/core/widgets/app_bar_widget.dart';
import 'package:friut_hub/core/widgets/my_button_widget.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/features/e_commerce/cart/domain/entities/cart_item_entity.dart';
import 'package:friut_hub/features/e_commerce/cart/presintation/bloc/cart_bloc.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/pages/checkout_page_view.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/pages/skeletonizer_product_grid.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/widgets/cart_widgets/num_of_products_in_cart_widget.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/widgets/cart_widgets/products_in_cart_row_widget.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/widgets/cart_widgets/skeleton_cart_widget.dart';

class MyCartPage extends StatefulWidget {
  const MyCartPage({super.key});

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  List<CartItemEntity> _cartItems = [];

  //double get _totalPrice => _cartItems.fold(
  //0,
  //(sum, item) => sum + (item.price * item.quantity),
  //);

  @override
  void initState() {
    super.initState();
    context.read<CartBloc>().add(GetCartProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F5F7),
      appBar: MyAppBar(appBarTitle: "السلة"),
      body: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          if (state is CartInitial) {
            context.read<CartBloc>().add(GetCartProductsEvent());
          }
          if (state is CartroductsLoaded) {
            setState(() {
              _cartItems = List.from(state.cartItems.items);
            });
          }
          if (state is CartError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is CartLoading) {
            return ListView.builder(
              itemCount: 4,
              itemBuilder: (_, __) => const SkeletonCartRow(),
            );
          }

          if (state is CartroductsLoaded) {
            if (_cartItems.isEmpty) {
              return Center(
                child: Text(
                  "السلة فارغة",
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );

              /*
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
               */
            }

            return Column(
              children: [
                const SizedBox(height: 20),
                NumProductsInCart(productNum: _cartItems.length),
                const SizedBox(height: 15),
                SizedBox(
                  height: 450,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: _cartItems.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return ProductsInCartRow(
                        item: _cartItems[index],
                        /*
                        onQuantityChanged: (newQuantity) {
                          setState(() {
                            _cartItems[index] = CartItemEntity(
                              productId: _cartItems[index].productId,
                              productName:
                                  _cartItems[index].productName,
                              price: _cartItems[index].price,
                              quantity: newQuantity,
                              subTotal:
                                  _cartItems[index].price *
                                  newQuantity,
                            );
                          });
                          
                        },*/
                      );
                    },
                  ),
                ),
                SizedBox(height: 30.h(context)),
                MyButton(
                  onTap:
                      () => Navigator.pushNamed(
                        context,
                        CheckoutPage.routeName,
                      ),
                  content: Text(
                    "الدفع ${state.cartItems.totalPrice.toStringAsFixed(0)} جنيه",
                    style: AppTextStyles.bodyBaseBold,
                  ),
                ),
              ],
            );
          }

          if (state is CartError) {
            return Center(child: Text(state.message));
          }

          return Text("$state");
        },
      ),
    );
  }
}
// ! old code ver 2 (6/3/2026)
/*
class MyCartPage extends StatefulWidget {
  const MyCartPage({super.key});

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  final Map<int, double> _subTotals = {}; // productId -> subTotal

  double get _totalPrice =>
      _subTotals.values.fold(0, (sum, e) => sum + e);

  @override
  void initState() {
    context.read<CartBloc>().add(GetCartProductsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F5F7),
      appBar: MyAppBar(appBarTitle: "السلة"),
      body: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          // if (state is CartInitial) {
          //   context.read<CartBloc>().add(GetCartProductsEvent());
          // }
        },
        builder: (context, state) {
          if (state is CartroductsLoaded) {
            List<CartItemEntity> cartItems = state.cartItems.items;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              for (final item in cartItems) {
                _subTotals[item.productId] = item.subTotal;
              }
            });

            return Column(
              children: [
                SizedBox(height: 20),
                NumProductsInCart(productNum: cartItems.length),
                SizedBox(height: 15),
                SizedBox(
                  height: 450,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    padding: EdgeInsets.all(0),
                    itemBuilder: (context, index) {
                      return ProductsInCartRow(
                        item: cartItems[index],
                        onSubPriceChanged: (newSubTotal) {
                          setState(() {
                            _subTotals[cartItems[index].productId] =
                                newSubTotal;
                          });
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 30.h(context)),
                MyButton(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      CheckoutPage.routeName,
                    );
                  },
                  content: Text(
                    "الدفع ${_totalPrice.toStringAsFixed(0)} جنيه",
                    style: AppTextStyles.bodyBaseBold,
                  ),
                ),
              ],
            );
          } else if (state is CartError) {
            return Center(child: Text(state.message));
          } else if (state is CartLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Text(" $state ");
          }
        },
      ),
    );
  }
}
 */
/*
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
                  "${item.price} جنيه ",
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