import 'package:flutter/material.dart';
import 'package:friut_hub/core/colors/app_colors.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  String hint;
  final String? Function(String?)? validator;

  PasswordField({
    super.key,
    required this.controller,
    this.hint = "كلمة المرور",
    required this.validator,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true; // start hidden

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        style: AppTextStyles.bodyBaseBold.copyWith(
          color: Colors.black,
        ),

        validator: widget.validator,
        controller: widget.controller,
        obscureText: _obscureText,
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
          hintText: widget.hint,
          hintStyle: AppTextStyles.bodySmallBold.copyWith(
            color: AppColors.grayscale400,
            fontWeight: FontWeight.bold,
          ),
          // ✅ Show/hide icon
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey[600],
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText; // toggle visibility
              });
            },
          ),
        ),
      ),
    );
  }
}
