import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friut_hub/auth/presentation/widgets/my_button_widget.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/e_commerce/presintaion/pages/home_page.dart';
import 'package:friut_hub/e_commerce/presintaion/pages/item_details_page.dart';
import 'package:friut_hub/e_commerce/presintaion/pages/notifications_page.dart';
import 'package:friut_hub/generated/assets.dart';

class ProductsPage extends StatelessWidget {
  TextEditingController minPriceController = TextEditingController();
  TextEditingController maxPriceController = TextEditingController();

  ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F5F7),
      body: Column(
        children: [
          SizedBox(height: 50.h(context)),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 30.w(context)),
                Center(
                  child: Text(
                    "المنتجات",
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationsPage(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    child: SvgPicture.asset(
                      Assets.svgNotificationRing,
                      height: 20.h(context),
                      width: 20.w(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
          MySearchBar(),
          SizedBox(height: 10.h(context)),
          ProductROw(
            text1: "منتجاتنا",
            widget2: InkWell(
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
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,

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
                              mainAxisAlignment:
                                  MainAxisAlignment.end,
                              children: [
                                Text(
                                  " : السعر",
                                  style: AppTextStyles.bodyLarge
                                      .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                ),
                                SvgPicture.asset(Assets.svgTag),
                              ],
                            ),

                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.center,
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
                                        padding:
                                            const EdgeInsets.symmetric(
                                              horizontal: 12.0,
                                            ),
                                        child: tarteeb(),
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
            ),
          ),
          SizedBox(
            height: 120.h(context),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 39,
                        child: Image.asset(
                          Assets.pngWatermellonPng,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 10.h(context)),
                      Text(
                        "بطيخ",
                        style: AppTextStyles.bodySmallBold,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          ProductROw(
            text1: "الأكثر مبيعًا",
            widget2: Text("المزيد", style: AppTextStyles.bodySmall),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: 10,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: .9,
                  ),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 20,
                        right: 40,
                        child: Image.asset(
                          height: 120,
                          width: 120,
                          Assets.pngFruitBasketAmico1Splash1,
                        ),
                      ),
                      // ! same problem
                      // Center(
                      // child: SvgPicture.asset(Assets.svgFarawlla),
                      // ),
                      Positioned(
                        bottom: 20,
                        right: 10,
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              "بطيخ",
                              style: AppTextStyles.bodySmallBold
                                  .copyWith(color: Colors.black),
                            ),
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
                      ),
                      Positioned(
                        bottom: 20,
                        left: 10,
                        child: ItemAddIcon(
                          onTap:
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ItemDetailsPage(),
                                ),
                              ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class tarteeb extends StatefulWidget {
  const tarteeb({super.key});

  @override
  State<tarteeb> createState() => _tarteebState();
}

class _tarteebState extends State<tarteeb> {
  int _selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: 32.h(context)),
        Text(
          " : ترتيب حسب",
          style: AppTextStyles.bodyLarge.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        RadioListTile<int>(
          title: Text('Option 1'),
          value: 0,
          groupValue: _selectedOption,
          onChanged: (value) {
            setState(() {
              _selectedOption = value!;
            });
          },
        ),
        RadioListTile<int>(
          title: Text('Option 1'),
          value: 1,
          groupValue: _selectedOption,
          onChanged: (value) {
            setState(() {
              _selectedOption = value!;
            });
          },
        ),
        RadioListTile<int>(
          title: Text('Option 1'),
          value: 1,
          groupValue: _selectedOption,
          onChanged: (value) {
            setState(() {
              _selectedOption = value!;
            });
          },
        ),
      ],
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

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        width: 343.w(context),
        child: TextField(
          decoration: InputDecoration(
            hintText: "ابحث عن.......",
            hintStyle: AppTextStyles.bodySmall,
            border: InputBorder.none,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(7.0),
              child: SvgPicture.asset(
                Assets.svgSearchNormal,
                height: 30,
                width: 30,
              ),
            ),
            prefixIconConstraints: BoxConstraints(
              maxHeight: 40,
              maxWidth: 40,
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(7.0),
              child: SvgPicture.asset(
                Assets.svgFilterNormal,
                height: 30,
                width: 30,
              ),
            ),
            suffixIconConstraints: BoxConstraints(
              maxHeight: 40,
              maxWidth: 40,
            ),
          ),
        ),
      ),
    );
  }
}

class ProductROw extends StatelessWidget {
  String text1;
  final Widget widget2;
  ProductROw({super.key, required this.text1, required this.widget2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1,
            style: AppTextStyles.bodyBaseBold.copyWith(
              color: Colors.black,
            ),
          ),
          widget2,
        ],
      ),
    );
  }
}

class PriceRangeSlider extends StatefulWidget {
  TextEditingController minPriceController;
  TextEditingController maxPriceController;

  PriceRangeSlider({
    super.key,
    required this.minPriceController,
    required this.maxPriceController,
  });

  @override
  State<PriceRangeSlider> createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  RangeValues _priceRange = const RangeValues(50, 300);

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        valueIndicatorColor: Colors.transparent,
        valueIndicatorTextStyle: const TextStyle(
          color: Colors.transparent,
        ),
      ),
      child: RangeSlider(
        activeColor: AppColors.green1_500,
        values: _priceRange,
        min: 0,
        max: 500,
        divisions: 100,
        labels: RangeLabels(
          '\$${_priceRange.start.toInt()}',
          '\$${_priceRange.end.toInt()}',
        ),
        onChanged: (values) {
          setState(() {
            _priceRange = values;
          });
        },
      ),
    );
  }
}
