import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6, // Adjust width
                      height: 80, // Adjust height
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.primaryColor,
                          prefixIcon: Icon(Icons.search_rounded, color: AppColors.offWhite),
                          hintText: 'Shake the phone to read',
                          hintStyle: CustomTextStyles.poppins500style18white,
                          border: getBorderStyle(),
                          enabledBorder: getBorderStyle(),
                          focusedBorder: getBorderStyle(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder getBorderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: AppColors.grey),
    );
  }
}