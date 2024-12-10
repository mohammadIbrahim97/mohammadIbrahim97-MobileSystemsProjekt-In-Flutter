import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';

class CustomTextFormFields extends StatelessWidget {
  const CustomTextFormFields({super.key, required this.labelText});
  final String labelText;

  @override
  Widget build(BuildContext context){
    return  Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 24.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: CustomTextStyles.poppins500style18,
          border: getBorderStyle(),
          enabledBorder: getBorderStyle(),
          focusedBorder: getBorderStyle(),
        ),
      ),
    );
  }
}

OutlineInputBorder getBorderStyle() {
  return  OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide(color: AppColors.grey),
  );
}