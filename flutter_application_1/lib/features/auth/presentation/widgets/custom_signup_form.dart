import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_strings.dart';
import 'package:flutter_application_1/core/widgets/custom_button.dart';
import 'package:flutter_application_1/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter_application_1/features/auth/presentation/widgets/terms_and_condition_widget.dart';



class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const CustomTextFormFields(labelText: AppStrings.fristName),
          const CustomTextFormFields(labelText: AppStrings.lastName),
          const CustomTextFormFields(labelText: AppStrings.emailAddress),
          const CustomTextFormFields(labelText: AppStrings.password),
          const TermsAndConditions(),
          const SizedBox(height: 88),
          CustomBtn(onPressed: () {}, text: AppStrings.signUp),
        ],
      ),
    );
  }
}