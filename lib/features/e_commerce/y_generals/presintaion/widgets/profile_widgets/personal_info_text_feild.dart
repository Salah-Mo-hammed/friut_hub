// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';

class PersonalInfoTextFeild extends StatelessWidget {
  final String hintLabel;
  final bool isPassword;
  TextEditingController controller;
   PersonalInfoTextFeild({
    super.key,
    required this.hintLabel,
    required this.isPassword,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppTextStyles.bodyBaseBold.copyWith(color: Colors.black),
      controller: controller,

      autofillHints:
      // widget.obscureText
      // ? [AutofillHints.password]
      [AutofillHints.email],
      // textDirection: TextDirection.rtl,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF9FAFA),

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
        hintText: hintLabel,
        hintStyle: AppTextStyles.bodySmallBold.copyWith(
          color: AppColors.grayscale400,
          fontWeight: FontWeight.bold,
        ),
        // Show/hide icon
        suffixIcon: IconButton(
          icon: Icon(
            isPassword ? Icons.visibility : Icons.edit_outlined,
            color: Colors.grey[600],
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
