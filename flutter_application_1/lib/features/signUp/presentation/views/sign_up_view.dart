
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/features/signUp/presentation/views/widgets/sign_up_form_field.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_button.dart';
import './widgets/terms_check_box.dart';


class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
            child: Text(
              AppStrings.welcome, // Using custom string
                style: CustomTextStyles.poppins500style24.copyWith(fontWeight: FontWeight.bold) // Using custom style
              ),
            ),
            const SizedBox(height: 24.0),

            // First Name Input Field
            const WelcomeFormField(label: AppStrings.firstName),
            const SizedBox(height: 16.0),

            // Last Name Input Field
            const WelcomeFormField(label: AppStrings.lastName),
            const SizedBox(height: 16.0),

            // Email Input Field
            const WelcomeFormField(label: AppStrings.emailAddress),
            const SizedBox(height: 16.0),

            // Password Input Field with obscuring
            const WelcomeFormField(
              label: AppStrings.password,
              isPassword: true,
            ),
            const SizedBox(height: 16.0),

            // Terms and Conditions Checkbox
            const TermsCheckbox(),
            const SizedBox(height: 24.0),

            CustomBtn(
              text: AppStrings.signUp,
              onPressed: () {
                // Validate and submit form
              },
            ),

            const SizedBox(height: 16.0),
            Center(
              child: TextButton(
                onPressed: () {
                  // Navigate to Sign In page
                },
                child: Text(
                    "${AppStrings.alreadyHaveAnAccount} ${AppStrings.signIn}",
                    style:TextStyle(color: AppColors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
