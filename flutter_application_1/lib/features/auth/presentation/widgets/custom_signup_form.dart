import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_strings.dart';
import 'package:flutter_application_1/core/widgets/custom_button.dart';
import 'package:flutter_application_1/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:flutter_application_1/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:flutter_application_1/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter_application_1/features/auth/presentation/widgets/terms_and_condition_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.signupFormKey,
          child: Column(
            children: [
              CustomTextFormFields(
                labelText: AppStrings.firstName,
                onChanged: (firstName) {
                  authCubit.firstName = firstName;
                },
                onFieldSubmitted: (value) {},
              ),
              CustomTextFormFields(
                labelText: AppStrings.lastName,
                onChanged: (lastName) {
                  authCubit.lastName = lastName;
                },
                onFieldSubmitted: (value) {},
              ),
              CustomTextFormFields(
                labelText: AppStrings.emailAddress,
                onChanged: (emailAddress) {
                  authCubit.emailAddress = emailAddress;
                },
                onFieldSubmitted: (value) {},
              ),
              CustomTextFormFields(
                labelText: AppStrings.password,
                onChanged: (passwprd) {
                  authCubit.password = passwprd;
                },
                onFieldSubmitted: (value) {},
              ),
              const TermsAndConditions(),
              const SizedBox(height: 88),
              CustomBtn(
                color: authCubit.termsAndConditionsCheckBoxValue == true
                    ? AppColors.primaryColor
                    : AppColors.deepGrey,
                onPressed: () {
                if (authCubit.termsAndConditionsCheckBoxValue == true) {
                    if (authCubit.signupFormKey.currentState!.validate()) {
                      authCubit.signUpWithEmailAndPassword();
                    }
                  }
              }, text: AppStrings.signUp),
            ],
          ),
        );
      },
    );
  }
}