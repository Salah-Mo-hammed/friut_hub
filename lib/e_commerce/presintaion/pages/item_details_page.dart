import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
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
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // ! Column item name nnd price
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                      // ! bad way to make space , you should use mainAxsisAlingment , but something wrong in it
                      SizedBox(width: 140),
                      // ! for increase ,decrease ,and number of items
                      ItemQuantityWidget(onQuantityChanged: (value) {
    selectedQuantity = value;
    debugPrint('Quantity: $selectedQuantity');
  },),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemQuantityWidget extends StatefulWidget {
    final ValueChanged<int> onQuantityChanged;

  const ItemQuantityWidget({super.key, required this.onQuantityChanged,});

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