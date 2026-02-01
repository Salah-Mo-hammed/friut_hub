//! still need improvments , how to check that its true , this is a seperated widget
import 'package:flutter/material.dart';
import 'package:friut_hub/core/colors/app_colors.dart';

class PoliciesCheckBox extends StatefulWidget {
  bool checkboxValeu = false;
  PoliciesCheckBox({super.key});

  @override
  State<PoliciesCheckBox> createState() => _PoliciesCheckBoxState();
}

class _PoliciesCheckBoxState extends State<PoliciesCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(5),
      ),
      activeColor: AppColors.green1_500,
      value: widget.checkboxValeu,
      onChanged: (value) {
        setState(() {
          widget.checkboxValeu = !widget.checkboxValeu;
          //* or
          // widget.checkboxValeu = value!;
        });
      },
    );
  }
}
