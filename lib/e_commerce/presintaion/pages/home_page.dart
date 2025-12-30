import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/e_commerce/presintaion/pages/item_details_page.dart';
import 'package:friut_hub/generated/assets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
        //! AppBar Row
        // ! Note: we didnt use MyAppBar here because there is somechanges in it here
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.svgPersonIcon,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(width: 5),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          "صباح الخير !..",
                          style: AppTextStyles.bodyBase.copyWith(
                            color: AppColors.grayscale400,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "أحمد مصطفي",
                        style: AppTextStyles.bodyBaseBold.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SvgPicture.asset(
                  Assets.svgNotificationRing,
                  height: 20.h(context),
                  width: 20.w(context),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h(context)),
        Padding(
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
        ),
        SizedBox(height: 10),
        // Stack(
        //   children: [
        //     Image.asset(Assets.pngOrangeOfferPng),
        //     Positioned(
        //       left: 170.w(context),
        //       child: Image.asset(Assets.pngOrangeCircle),
        //     ),
        //   ],
        // ),
        Image.asset(Assets.pngOrangeOfferPng),

        // ! svg is the best but for now here is a problem in fetching image
        // SvgPicture.asset('assets/svg/orange_offer.svg'),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "الأكثر مبيعًا",
                style: AppTextStyles.bodyBaseBold.copyWith(
                  color: Colors.black,
                ),
              ),
              Text("المزيد", style: AppTextStyles.bodySmall),
            ],
          ),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}

class ItemAddIcon extends StatelessWidget {
  IconData icon;
  void Function() onTap;
  ItemAddIcon({
    super.key,
    this.icon = Icons.add,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22,
      backgroundColor:
          icon == Icons.add ? AppColors.green1_500 : Colors.white,
      child: GestureDetector(
        onTap: onTap,

        child: Padding(
          padding:
              icon == Icons.add
                  ? EdgeInsets.zero
                  : EdgeInsets.only(bottom: 10.0),
          child: Icon(
            size: 35,
            icon,
            color: icon == Icons.add ? Colors.white : Colors.grey,
          ),
        ),
      ),
    );
  }
}
