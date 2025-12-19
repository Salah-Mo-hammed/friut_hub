//! Note: this appbar will appear alot of times with some changes , so better to use switch and case (payments , searchs ,notifications )
// ! they are all have the same leading (back arrow to pop) , differece is title and some of pages will have 1 action , so better to use ENUM and switch cases
// ! so evrytime you build a new page , you will modify this widget by adding switch case and enum
import 'package:flutter/material.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';

class MyAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  final String appBarTitle;

  const MyAppBar({super.key, required this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Color(0xFFF1F1F5)),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
      ),
      centerTitle: true,
      title: Text(
        appBarTitle,
        style: AppTextStyles.bodyLarge.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
