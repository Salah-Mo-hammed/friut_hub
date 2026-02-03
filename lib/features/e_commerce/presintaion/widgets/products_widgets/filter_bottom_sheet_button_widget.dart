import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/core/widgets/my_button_widget.dart';
import 'package:friut_hub/features/e_commerce/presintaion/pages/product_page.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/products_widgets/price_range_slider_widget.dart';
import 'package:friut_hub/features/e_commerce/presintaion/widgets/products_widgets/arrange_modal_bottom_sheet_widget.dart';
import 'package:friut_hub/generated/assets.dart';

class FilterBottomSheetButton extends StatelessWidget {
  const FilterBottomSheetButton({
    super.key,
    required this.minPriceController,
    required this.maxPriceController,
  });

  final TextEditingController minPriceController;
  final TextEditingController maxPriceController;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SvgPicture.asset(Assets.svgMotagatna),
      onTap: () {
        // TODO: what this button do

        showModalBottomSheet(
          context: context,
          builder: (context) {
            return SizedBox(
              height: 314.h(context),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: [
                    SizedBox(height: 32.h(context)),
                    Text(
                      " : تصنيف حسب",
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(height: 11.h(context)),
                    // : السعر
                    Row(
                      children: [
                        SvgPicture.asset(Assets.svgTag),

                        Text(
                          "  السعر :",
                          style: AppTextStyles.bodyLarge.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _numberFeild(
                          priceController: minPriceController,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "الي",
                            style: AppTextStyles.bodySmallBold
                                .copyWith(fontSize: 15),
                          ),
                        ),
                        _numberFeild(
                          priceController: maxPriceController,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    PriceRangeSlider(
                      minPriceController: minPriceController,
                      maxPriceController: maxPriceController,
                    ),
                    SizedBox(height: 10),
                    MyButton(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return SizedBox(
                              height: 314.h(context),
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                ),
                                child: ArrangeModalBottomSheet(),
                              ),
                            );
                          },
                        );
                      },
                      buttonTitle: "تصفيه",
                    ),
                  ],
                ),
              ),
            );
          },
        );
        // showDialog(
        //   context: context,
        //   builder: (context) {
        //     return AlertDialog(
        //       icon: Icon(Icons.accessibility_sharp),
        //       title: Text('Accessibility'),
        //       content: Text('This is an alert dialog'),
        //       actions: [
        //         TextButton(
        //           onPressed: () => Navigator.pop(context),
        //           child: Text('OK'),
        //         ),
        //       ],
        //     );
        //   },
        // );
      },
    );
  }
}

class _numberFeild extends StatelessWidget {
  TextEditingController priceController;
  _numberFeild({super.key, required this.priceController});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.h(context),
      width: 135.w(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFFCDD2DE)),
      ),
      child: Center(
        child: TextField(
          controller: priceController,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "0",
          ),
        ),
      ),
    );
  }
}
