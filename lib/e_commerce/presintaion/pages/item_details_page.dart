import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friut_hub/auth/presentation/widgets/my_button_widget.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/e_commerce/presintaion/pages/home_page.dart';
import 'package:friut_hub/generated/assets.dart';

class ItemDetailsPage extends StatelessWidget {
  int selectedQuantity = 1;
  ItemDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xFFF3F5F7),
        body: Stack(
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
            Positioned(
              top: 55,
              right: 30,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Color(0xFFF1F1F5),
                  ),
                  shape: BoxShape.circle,
                ),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: Color(0xFFF3F5F7),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.arrow_back_ios),
                    ),
                  ),
                ),
              ),
            ),

            // rest components: column
            Positioned(
              top: 430,
              // left: 0,
              right: 20,
              bottom: 0,
              child: SizedBox(
                width: 342.w(context),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          // ! Column item name nnd price
                          Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                "بطيخ",
                                style: AppTextStyles.bodySmallBold
                                    .copyWith(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    "20جنية / ",
                                    style: AppTextStyles.bodySmallBold
                                        .copyWith(
                                          fontSize: 15,
                                          color: AppColors.orange500,
                                        ),
                                  ),
                                  Text(
                                    "الكيلو",
                                    style: AppTextStyles.bodySmallBold
                                        .copyWith(
                                          fontSize: 15,
                                          color: AppColors.orange300,
                                        ),
                                  ),
                                ],
                              ),
                            ],
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
                      Row(
                        children: [
                          SizedBox(width: 5),
                          Icon(Icons.star, color: Colors.amber),
                          SizedBox(width: 5),

                          Text("(+30)"),
                          SizedBox(width: 5),

                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "المراجعه",
                                  style: AppTextStyles.bodyBaseBold
                                      .copyWith(
                                        color: AppColors.green1_500,
                                        decoration:
                                            TextDecoration.underline,
                                        fontSize: 15,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.grayscale500,
                          fontSize: 17,
                        ),
                        "ينتمي إلى الفصيلة القرعية ولثمرته لُب حلو المذاق وقابل للأكل، وبحسب علم النبات فهي تعتبر ثمار لبيّة، تستعمل لفظة البطيخ للإشارة إلى النبات نفسه أو إلى الثمرة تحديداً",
                      ),
                      SizedBox(height: 20),

                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                        children: [
                          ItemDetailsRow(
                            svgImage: Assets.svgItemDetails2,
                            text1: "عام",
                            text2: "الصلاحيه",
                          ),
                          ItemDetailsRow(
                            svgImage: Assets.svgItemDetails1,
                            text1: "100%",
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
                            text1: "80 كالوري",
                            text2: "100 جرام",
                          ),

                          ItemDetailsRow(
                            svgImage: Assets.svgItemDetails3,
                            text1: "4.8 (256)",
                            text2: "Reviews",
                          ),
                        ],
                      ),

                      MyButton(
                        onTap: () {},
                        buttonTitle: "أضف الي السلة",
                      ),
                      // ! for later updates and adjastments (GridView)
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemDetailsRow extends StatelessWidget {
  String svgImage;
  String text1;
  String text2;
  ItemDetailsRow({
    super.key,
    required this.svgImage,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text1,
              style: AppTextStyles.bodyBaseBold.copyWith(
                color: AppColors.green1_600,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 5),
            Text(
              text2,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.grayscale500,
                fontSize: 18,
              ),
            ),
          ],
        ),
        SizedBox(width: 10),
        SvgPicture.asset(
          svgImage,
          height: 50.h(context),
          width: 50.w(context),
        ),
      ],
    );
  }
}

class ItemQuantityWidget extends StatefulWidget {
  final ValueChanged<int> onQuantityChanged;

  const ItemQuantityWidget({
    super.key,
    required this.onQuantityChanged,
  });

  @override
  State<ItemQuantityWidget> createState() =>
      _ItemQuantityWidgetState();
}

class _ItemQuantityWidgetState extends State<ItemQuantityWidget> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ItemAddIcon(
          onTap: () {
            setState(() {
              quantity++;
            });
            widget.onQuantityChanged(quantity);
          },
        ),
        SizedBox(width: 20),
        Text(
          quantity.toString(),
          style: AppTextStyles.bodyBaseBold.copyWith(
            fontSize: 21,
            color: Colors.black,
          ),
        ),
        SizedBox(width: 20),
        ItemAddIcon(
          icon: Icons.minimize_outlined,
          onTap: () {
            setState(() {
              if (quantity != 1) quantity--;
            });
            widget.onQuantityChanged(quantity);
          },
        ),
      ],
    );
  }
}

  // Scaffold(
  //           ,
  //           body: 
  //         ),