import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/features/e_commerce/y_generals/entites/bottom_nav_bar_items_entity.dart';
import 'package:friut_hub/features/e_commerce/products/presintation/blocs/products_bloc/products_bloc.dart';

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
    return Container(
      height: 85,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      //const BoxDecoration(
      //   color: Color(0xFFFFFFFF),
      //   borderRadius: BorderRadius.only(
      //     topLeft: Radius.circular(10),
      //     topRight: Radius.circular(10),
      //   ),
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(bottomNavBarItems.length, (index) {
          final isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () {
              if (index == 0) {
                context.read<ProductsBloc>().add(
                  GetAllProductsEvent(),
                );
              }
              onTap(index);
            },
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
                          bottomNavBarItems[index].inActiveInage,

                          isSelected,
                        )
                        : Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            bottom_nav_icon(
                              bottomNavBarItems[index].activeImage,

                              isSelected,
                            ),
                            //! overdlowed pixels roblem because of this sizedbox
                            const SizedBox(width: 5),
                            Flexible(
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                bottomNavBarItems[index].text,
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

  CircleAvatar bottom_nav_icon(String icon, bool isSelected) {
    return CircleAvatar(
      radius: 17,
      backgroundColor:
          isSelected ? AppColors.green1_500 : Color(0xFFFFFFFF),
      child: SvgPicture.asset(height: 19, width: 19, icon),
    );
  }
}
