import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:friut_hub/core/extentions/num_extenstions.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';
import 'package:friut_hub/features/e_commerce/products/presintation/blocs/products_bloc/products_bloc.dart';
import 'package:friut_hub/generated/assets.dart';

class CustomSearchBarWidget extends StatefulWidget {
  const CustomSearchBarWidget({super.key});

  @override
  State<CustomSearchBarWidget> createState() =>
      _CustomSearchBarWidgetState();
}

class _CustomSearchBarWidgetState
    extends State<CustomSearchBarWidget> {
  final TextEditingController searchController =
      TextEditingController();
  bool _isSearching = false;
  bool _isFilting = false;

  void _toggleSearch() {
    setState(() => _isSearching = !_isSearching);

    if (_isSearching) {
      context.read<ProductsBloc>().add(
        SearchProductsEvent(searchController.text),
      );
    } else {
      searchController.clear();
      context.read<ProductsBloc>().add(
        GetAllProductsEvent(),
      ); // reset
    }
  }

  void _toggleFilter() {
    setState(() => _isFilting = !_isFilting);

    if (_isFilting) {
      // context.read<ProductsBloc>().add(
      // SearchProductsEvent(searchController.text),
      // );
    } else {
      // searchController.clear();
      // context.read<ProductsBloc>().add(
      // SearchProductsEvent(''),
      // ); // reset
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

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
          controller: searchController,
          decoration: InputDecoration(
            hintText: "ابحث عن.......",
            hintStyle: AppTextStyles.bodySmall,
            border: InputBorder.none,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(7.0),
              child: GestureDetector(
                onTap: _toggleSearch,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return RotationTransition(
                      turns: Tween(
                        begin: 0.75,
                        end: 1.0,
                      ).animate(animation),
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    );
                  },
                  child:
                      !_isSearching && searchController.text.isEmpty
                          ? SvgPicture.asset(
                            Assets.svgSearchNormal,
                            key: const ValueKey('search'),
                            height: 30,
                            width: 30,
                          )
                          : SvgPicture.asset(
                            Assets.svgCloseSquare,
                            key: const ValueKey('close'),
                            height: 30,
                            width: 30,
                          ),
                ),
              ),
            ),
            prefixIconConstraints: BoxConstraints(
              maxHeight: 40,
              maxWidth: 40,
            ),
            suffixIcon:
                _isSearching
                    ? null
                    : GestureDetector(
                      onTap: () {
                        _toggleFilter();
                        // ! show somthing for filring
                      },
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder: (child, animation) {
                          return RotationTransition(
                            turns: Tween(
                              begin: 0.5,
                              end: .5,
                            ).animate(animation),
                            child: FadeTransition(
                              opacity: animation,
                              child: child,
                            ),
                          );
                        },
                        child:
                            _isFilting
                                ? Padding(
                                  key: const ValueKey(
                                    'filter_active',
                                  ),
                                  padding: const EdgeInsets.all(7.0),
                                  child: Transform.rotate(
                                    angle: math.pi / 2,
                                    child: SvgPicture.asset(
                                      Assets.svgFilterNormal,
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                )
                                : Padding(
                                  key: const ValueKey(
                                    'filter_inactive',
                                  ),
                                  padding: const EdgeInsets.all(7.0),
                                  child: SvgPicture.asset(
                                    Assets.svgFilterNormal,
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
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

// class CustomSearchBarWidget extends StatelessWidget {
//   TextEditingController searchController = TextEditingController();
//   CustomSearchBarWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15.0),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         width: 343.w(context),
//         child: TextField(
//           controller: searchController,
//           decoration: InputDecoration(
//             hintText: "ابحث عن.......",
//             hintStyle: AppTextStyles.bodySmall,
//             border: InputBorder.none,
//             prefixIcon: Padding(
//               padding: const EdgeInsets.all(7.0),
//               child: GestureDetector(
//                 onTap: () {
//                   context.read<ProductsBloc>().add(
//                     SearchProductsEvent(searchController.text),
//                   );
//                 },
//                 child: SvgPicture.asset(
//                   Assets.svgSearchNormal,
//                   height: 30,
//                   width: 30,
//                 ),
//               ),
//             ),
//             prefixIconConstraints: BoxConstraints(
//               maxHeight: 40,
//               maxWidth: 40,
//             ),
//             suffixIcon: Padding(
//               padding: const EdgeInsets.all(7.0),
//               child: SvgPicture.asset(
//                 Assets.svgFilterNormal,
//                 height: 30,
//                 width: 30,
//               ),
//             ),
//             suffixIconConstraints: BoxConstraints(
//               maxHeight: 40,
//               maxWidth: 40,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
