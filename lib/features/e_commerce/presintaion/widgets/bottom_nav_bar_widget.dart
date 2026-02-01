import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/generated/assets.dart';

class FancyBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const FancyBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final unselectedIcons = [
      Assets.svgUnselectedHomeIcon,
      Assets.svgUnselectedProductsIcon,
      Assets.svgUnselectedShoppingCartIcon,
      Assets.svgUnselectedProfileIcon,
    ];
    final selectedIcons = [
      Assets.svgSelectedHomeIcon,
      Assets.svgSelectedProductIcon,
      Assets.svgSelectedShoppingCartIcon,
      Assets.svgSelectedUserIcon,
    ];

    final labels = ["الرئيسية", "المنتجات", "سلة المشتريات", "حسابي"];

    return Container(
      height: 85,
      decoration: const BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(unselectedIcons.length, (index) {
          final isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () => onTap(index),
            child:
            // ! this animated to gorw container size
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutBack,
              transform: Matrix4.translationValues(
                0,
                isSelected ? -12 : 0,
                0,
              ),
              child:
              // ! this animated extends to show page name .
              //! Note: must be used layout builder for width enhancment (shopping cart vs others)
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: isSelected ? 40 : 40,
                width:
                    isSelected
                        ? (MediaQuery.sizeOf(context).width / 4) + 20
                        : 40,
                decoration: BoxDecoration(
                  borderRadius:
                      isSelected ? BorderRadius.circular(25) : null,
                  color:
                      isSelected
                          ? const Color(0xFFEEEEEE)
                          : const Color.fromARGB(0, 161, 23, 23),
                ),
                child:
                    !isSelected
                        ? bottom_nav_icon(
                          unselectedIcons,
                          index,
                          isSelected,
                        )
                        : Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            bottom_nav_icon(
                              selectedIcons,
                              index,
                              isSelected,
                            ),
                            //! overdlowed pixels roblem because of this sizedbox
                            const SizedBox(width: 5),
                            Flexible(
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                labels[index],
                                style: AppTextStyles.bodyXSmall
                                    .copyWith(
                                      color: AppColors.green1_500,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ],
                        ),
              ),
            ),
          );
        }),
      ),
    );
  }

  CircleAvatar bottom_nav_icon(
    List<String> icons,
    int index,
    bool isSelected,
  ) {
    return CircleAvatar(
      radius: 17,
      backgroundColor:
          isSelected ? AppColors.green1_500 : Color(0xFFFFFFFF),
      child: SvgPicture.asset(height: 19, width: 19, icons[index]),
    );
  }
}
// ! my old code
/*

import 'package:flutter/material.dart';

class FancyBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const FancyBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final icons = [
      Icons.home,
      Icons.production_quantity_limits,
      Icons.shopping_bag_outlined,
      Icons.person,
    ];

    final labels = ["الرئيسية", "المنتجات", "سلة التسوق", "حسابي"];

    return Container(
      height: 85,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 139, 102, 158),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(icons.length, (index) {
          final isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () => onTap(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutBack,
              transform: Matrix4.translationValues(
                0,
                isSelected ? -12 : 0,
                0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: isSelected ? 50 : 40,
                    width: isSelected ? 50 : 40,
                    decoration: BoxDecoration(
                      color:
                          isSelected
                              ? Colors.white
                              : Colors.transparent,
                      shape: BoxShape.circle,
                      boxShadow:
                          isSelected
                              ? [
                                BoxShadow(
                                  color: Colors.black.withOpacity(
                                    0.25,
                                  ),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ]
                              : [],
                    ),
                    child: Icon(
                      icons[index],
                      color:
                          isSelected
                              ? const Color.fromARGB(
                                255,
                                139,
                                102,
                                158,
                              )
                              : Colors.white,
                      size: isSelected ? 26 : 24,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    labels[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight:
                          isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

 */