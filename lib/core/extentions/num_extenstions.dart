import 'package:flutter/material.dart';

extension NumExtension on num {
  //! 812 is hight of the frame from figma
  double h(BuildContext context) =>
      toDouble() * MediaQuery.of(context).size.height / 812;

  //! 375 is width of the frame from figma
  double w(BuildContext context) =>
      toDouble() * MediaQuery.of(context).size.width / 375;
}
