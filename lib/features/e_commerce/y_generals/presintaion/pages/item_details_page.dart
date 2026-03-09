import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friut_hub/core/endpoints/endpoints.dart';
import 'package:friut_hub/core/widgets/my_button_widget.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/features/e_commerce/cart/presintation/bloc/cart_bloc.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/widgets/home_widgets/favourite_icon_widget.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/widgets/product_details_widgets/item_details_row_widget.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/widgets/product_details_widgets/item_quantity_widget.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/widgets/product_details_widgets/product_name_and_price_widget.dart';
import 'package:friut_hub/features/e_commerce/y_generals/presintaion/widgets/product_details_widgets/product_rate_widget.dart';
import 'package:friut_hub/features/e_commerce/products/presintation/blocs/product_details_bloc/product_details_bloc.dart';
import 'package:friut_hub/generated/assets.dart';

class ItemDetailsPage extends StatelessWidget {
  ItemDetailsPage({super.key});

  static const routeName = "ItemDetailsPage";

  int selectedQuantity = 1;

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
                    child: Image.network(
                      Endpoints.getImageUrl(product.imageUrl),
                      height: 300,
                      width: 300,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        print("❌ image error: $error");
                        return Image.asset(
                          height: 300,
                          width: 300,
                          Assets
                              .pngFruitBasketAmico1Splash1, // fallback
                        );
                      },
                    ),
                  ),
                ),
                // Back button
                Positioned(top: 20, right: 30, child: BackButton()),

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
                                  Row(
                                    children: [
                                      FavouriteIconWidget(
                                        product: state.product,
                                      ),
                                      SizedBox(width: 10),
                                      ProductNameAndPrice(
                                        productName: product.name,
                                        productPrice:
                                            product.price.toString(),
                                      ),
                                    ],
                                  ),
                                  // ! Column item name nnd price

                                  // ! for increase ,decrease ,and number of items
                                  ItemQuantityWidget(
                                    isIndetaildPRoduct: true,
                                    itemId: product.id,
                                    onQuantityChanged: (value) {
                                      selectedQuantity = value;
                                      debugPrint(
                                        'Quantity: $selectedQuantity',
                                      );
                                    },
                                    maxQuantity: product.stock!,
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
                    onTap: () {
                      context.read<CartBloc>().add(
                        AddToCartEvent(
                          productId: product.id,
                          quantity: selectedQuantity,
                        ),
                      );

                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "تم الاضافة الى السلة",
                                    style: AppTextStyles.bodyBaseBold
                                        .copyWith(
                                          color: Colors.black,
                                        ),
                                  ),
                                  const SizedBox(height: 20),

                                  SizedBox(
                                    width: 150,
                                    height: 70,
                                    child: MyButton(
                                      onTap: () {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      },
                                      content: Text(
                                        "OK",
                                        style:
                                            AppTextStyles
                                                .bodyBaseBold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
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
