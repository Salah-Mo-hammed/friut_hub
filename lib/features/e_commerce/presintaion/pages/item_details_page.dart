import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friut_hub/core/widgets/my_button_widget.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/product_details_widgets/item_details_row_widget.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/product_details_widgets/item_quantity_widget.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/product_details_widgets/product_name_and_price_widget.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/product_details_widgets/product_rate_widget.dart';
import 'package:friut_hub/features/e_commerce/products/presintation/blocs/product_details_bloc/product_details_bloc.dart';
import 'package:friut_hub/generated/assets.dart';

class ItemDetailsPage extends StatelessWidget {
  int selectedQuantity = 1;
  ItemDetailsPage({super.key});

  static const routeName = "ItemDetailsPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F5F7),
      body: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
        builder: (context, state) {
          if (state is ProductDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ProductDetailsError) {
            return Center(child: Text(state.message));
          }
          if (state is ProductByIdLoaded) {
            final product = state.product;
            return Stack(
              children: [
                // Background SVG
                Positioned(
                  top: 0,
                  right: 0,
                  child: SvgPicture.asset(
                    Assets.svgWhiteCircle,
                    height: 410,
                    width: 450,
                  ),
                ),
                // ! it must be svg but same problem
                Positioned(
                  top: 60,
                  right: 0,
                  left: 0,
                  child: Center(
                    child: Image.asset(
                      Assets.pngFruitBasketAmico1Splash1,
                    ),
                  ),
                ),
                // Back button
                Positioned(top: 55, right: 30, child: BackButton()),

                // rest components: column
                Positioned.fill(
                  top: 430,
                  // left: 0,
                  right: 20,
                  bottom: 0,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: SizedBox(
                        width: 342.w(context),
                        height: 500.h(context),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // ! Column item name nnd price
                                  ProductNameAndPrice(
                                    productName: product.name,
                                    productPrice:
                                        product.price.toString(),
                                  ),

                                  // ! for increase ,decrease ,and number of items
                                  ItemQuantityWidget(
                                    onQuantityChanged: (value) {
                                      selectedQuantity = value;
                                      debugPrint(
                                        'Quantity: $selectedQuantity',
                                      );
                                    },
                                  ),
                                ],
                              ),
                              ProductRate(),
                              SizedBox(height: 10),
                              Text(
                                style: AppTextStyles.bodySmall
                                    .copyWith(
                                      color: AppColors.grayscale500,
                                      fontSize: 17,
                                    ),
                                product
                                    .description!, //  "ينتمي إلى الفصيلة القرعية ولثمرته لُب حلو المذاق وقابل للأكل، وبحسب علم النبات فهي تعتبر ثمار لبيّة، تستعمل لفظة البطيخ للإشارة إلى النبات نفسه أو إلى الثمرة تحديداً",
                              ),
                              SizedBox(height: 20),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ItemDetailsRow(
                                    svgImage: Assets.svgItemDetails2,
                                    text1:
                                        product
                                            .expirationPeriodByDays!
                                            .toString(), //"عام",
                                    text2: "الصلاحيه",
                                  ),
                                  ItemDetailsRow(
                                    svgImage: Assets.svgItemDetails1,
                                    text1:
                                        product.isOrganic!
                                            .toString(), // "100%",
                                    text2: "اوجانيك",
                                  ),
                                ],
                              ),
                              SizedBox(height: 50),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ItemDetailsRow(
                                    svgImage: Assets.svgItemDetails4,
                                    text1:
                                        product.calories!
                                            .toString(), //"80 كالوري",
                                    text2: "100 جرام",
                                  ),

                                  ItemDetailsRow(
                                    svgImage: Assets.svgItemDetails3,
                                    text1: "4.8 (256)",
                                    text2: "Reviews",
                                  ),
                                ],
                              ),

                              // ! for later updates and adjastments (GridView)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 40,
                  child: MyButton(
                    onTap: () {},
                    content: Text(
                      "أضف الي السلة",
                      style: AppTextStyles.bodyBaseBold,
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
                        // ! line 127

                        //   SizedBox(
                        //     width: 200.w(context),
                        //     height: 200.h(context),
                        //     child: GridView.builder(
                        //       padding: EdgeInsets.zero,
                        //       itemCount: 4,
                        //       gridDelegate:
                        //           const SliverGridDelegateWithFixedCrossAxisCount(
                        //             crossAxisCount: 2,
                        //             crossAxisSpacing: 10,
                        //             mainAxisSpacing: 10,
                        //             // childAspectRatio: .7,
                        //           ),

                        //       itemBuilder:
                        //           (context, index) => Container(
                        //             decoration: BoxDecoration(
                        //               color: AppColors.grayscale50,
                        //               borderRadius: BorderRadius.circular(
                        //                 25,
                        //               ),
                        //             ),
                        //             child: Row(
                        //               children: [
                        //                 Column(
                        //                   children: [
                        //                     Text("100%"),
                        //                     SizedBox(height: 5),
                        //                     Text("organic"),
                        //                   ],
                        //                 ),
                        //                 SvgPicture.asset(
                        //                   width: 50,
                        //                   height: 50,
                        //                   Assets.svgItemDetails1,
                        //                 ),
                        //               ],
                        //             ),
                        //           ),
                        //     ),
                        //   ),