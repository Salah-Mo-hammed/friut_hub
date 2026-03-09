import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/core/widgets/app_bar_widget.dart';
import 'package:friut_hub/core/widgets/my_button_widget.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/features/e_commerce/cart/domain/entities/cart_item_entity.dart';
import 'package:friut_hub/features/e_commerce/cart/presintation/bloc/cart_bloc.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/pages/checkout_page_view.dart';
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
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "${state.message}\n temp CartError snackbar",
                ),
              ),
            );
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
                        arguments: state.cartItems.totalPrice,
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
            if (state.statusCode == 404) {
              return Center(
                child: Text(" error code 404 السلة فارغة"),
              );
            }
            return Text(state.message);
          }

          return Text("$state");
        },
      ),
    );
  }
}