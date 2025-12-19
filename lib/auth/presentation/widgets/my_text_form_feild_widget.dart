import 'package:flutter/material.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';

class BuildTextFormFeild extends StatefulWidget {
  final String hintLabel;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  bool obscureText;
  final TextInputType keyboardType;

  BuildTextFormFeild({
    super.key,
    required this.hintLabel,
    required this.controller,
    required this.validator,
    required this.obscureText,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<BuildTextFormFeild> createState() =>
      _BuildTextFormFeildState();
}
class _BuildTextFormFeildState extends State<BuildTextFormFeild> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTextStyles.bodyBaseBold.copyWith(color: Colors.black),
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      autofillHints:
          widget.obscureText
              ? [AutofillHints.password]
              : [AutofillHints.email],
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.grayscale50,
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            width: 0.3,
            color: AppColors.grayscale400,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        hintText: widget.hintLabel,
        hintStyle: AppTextStyles.bodySmallBold.copyWith(
          color: AppColors.grayscale400,
          fontWeight: FontWeight.bold,
        ),
        // ✅ Show/hide icon
        suffixIcon:
            widget.obscureText
                ? IconButton(
                  icon: Icon(
                    widget.obscureText
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.grey[600],
                  ),
                  onPressed: () {
                    setState(() {
                      widget.obscureText =
                          !widget.obscureText; // toggle visibility
                    });
                  },
                )
                : null,
      ),
    );
  }
}
