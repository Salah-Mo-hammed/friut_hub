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

class MyCartPage extends StatefulWidget {
  const MyCartPage({super.key});

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
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
          if (state is CartInitial) {
            context.read<CartBloc>().add(GetCartProductsEvent());
          }
        },
        builder: (context, state) {
          if (state is CartroductsLoaded) {
            List<CartItemEntity> cartItems = state.cartItems.items;
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
                        // onQuantityChanged: (itemQuantityValue) {
                        //   setState(() {
                        //     cartItems[index].quantity =
                        //         itemQuantityValue;
                        //   });
                        // },
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
                    "الدفع ${state.cartItems.totalPrice} جنيه",
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
