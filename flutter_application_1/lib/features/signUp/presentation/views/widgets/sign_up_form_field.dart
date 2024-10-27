import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class WelcomeFormField extends StatelessWidget {
  final String label; // Label for the input field
  final bool isPassword; // Whether the field is for password input

  const WelcomeFormField({
    super.key,
    required this.label,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword, // Hides text if it's a password field
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: AppColors.grey), // Label color when not focused
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey),
        ),
        suffixIcon: isPassword ? Icon(Icons.visibility, color: AppColors.grey) : null, // Adds icon if password field
      ),
    );
  }
}
