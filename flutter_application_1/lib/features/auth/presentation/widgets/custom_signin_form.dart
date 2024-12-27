import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/functions/custom_toast.dart';
import 'package:flutter_application_1/core/functions/navigation.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_strings.dart';
import 'package:flutter_application_1/core/widgets/custom_button.dart';
import 'package:flutter_application_1/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:flutter_application_1/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:flutter_application_1/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter_application_1/features/auth/presentation/widgets/forgot_password_text_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class CustomSignInForm extends StatelessWidget {
  const CustomSignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SigninSuccessState) {
          showToast("Signin successfully");
          customReplacementNavigate(context, "/homeNavBar");
        }
        else if (state is SigninFailureState) {
        showToast(state.errMessage);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.signinFormKey,
          child: Column(
            children: [
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
              const ForgotPasswordTextWidget(),
              const SizedBox(height: 102),
              state is SigninLoadingState
                  ? CircularProgressIndicator(color: AppColors.primaryColor,)
                :CustomBtn(
                onPressed: () {
                    if (authCubit.signinFormKey.currentState!.validate()) {
                      authCubit.signInWithEmailAndPassword();
                    }
                }, 
              text: AppStrings.signIn),
            ],
          ),
        );
      },
    );
  }
}


