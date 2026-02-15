import 'package:flutter/material.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/core/widgets/app_bar_widget.dart';
import 'package:friut_hub/core/widgets/my_button_widget.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/features/e_commerce/presintaion/pages/checkout_page_view.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/cart_widgets/num_of_products_in_cart_widget.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/cart_widgets/products_in_cart_row_widget.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F5F7),
      appBar: MyAppBar(appBarTitle: "السلة"),
      body: Column(
        children: [
          SizedBox(height: 20),
          NumProductsInCart(),
          SizedBox(height: 15),
          SizedBox(
            height: 450,
            width: double.infinity,
            child: ListView.builder(
              itemCount: 4,
              padding: EdgeInsets.all(0),
              itemBuilder: (context, index) {
                return ProductsInCartRow();
              },
            ),
          ),
          SizedBox(height: 30.h(context)),
          // TODO: here instade of 120 , it must be auto calculated
          MyButton(
            onTap: () {
              Navigator.pushNamed(context, CheckoutPage.routeName);
            },
            content: 
                          Text("الدفع  120جنيه",style: AppTextStyles.bodyBaseBold),
            
            
          ),
        ],
      ),
    );
  }
}
