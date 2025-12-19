import 'package:flutter/material.dart';
import 'package:friut_hub/core/fonts/fonts_class.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "حساب جديد",
          style: AppTextStyles.bodyLarge.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(child: Text("welocom in register page")),
    );
  }
}
