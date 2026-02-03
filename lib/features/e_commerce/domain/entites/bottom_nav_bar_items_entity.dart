// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:friut_hub/generated/assets.dart';

class BottomNavBarItemEntity {
  final String activeImage, inActiveInage, text;
  BottomNavBarItemEntity({
    required this.text,
    required this.activeImage,
    required this.inActiveInage,
  });

}
  List<BottomNavBarItemEntity> get bottomNavBarItems => [
    BottomNavBarItemEntity(
      text: "الرئيسية",
      activeImage: Assets.svgSelectedHomeIcon,
      inActiveInage: Assets.svgUnselectedHomeIcon,
    ),

    BottomNavBarItemEntity(
      text: "المنتجات",
      activeImage: Assets.svgSelectedProductIcon,
      inActiveInage: Assets.svgUnselectedProductsIcon,
    ),

    BottomNavBarItemEntity(
      text: "سلة المشتريات",
      activeImage: Assets.svgSelectedHomeIcon,
      inActiveInage: Assets.svgUnselectedHomeIcon,
    ),
    BottomNavBarItemEntity(
      text: "حسابي",
      activeImage: Assets.svgSelectedUserIcon,
      inActiveInage: Assets.svgUnselectedProfileIcon,
    ),
  ];
