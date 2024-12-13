import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_strings.dart';
import 'package:flutter_application_1/features/auth/presentation/widgets/custom_signup_form.dart';
import 'package:flutter_application_1/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter_application_1/features/auth/presentation/widgets/have_an_account_widget.dart';
import 'package:flutter_application_1/features/auth/presentation/widgets/terms_and_condition_widget.dart';
import 'package:flutter_application_1/features/auth/presentation/widgets/wellcome_text_widgets.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({ super.key});

  @override
  Widget build(BuildContext context) {
   return const Scaffold(
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: [
           SliverToBoxAdapter(
            child: SizedBox(height: 152)),
           SliverToBoxAdapter(
            child: WelcomeTextWidget(text: AppStrings.welcome)),
           SliverToBoxAdapter(
            child: SizedBox(height: 16)),
           SliverToBoxAdapter(child: CustomSignUpForm()),
             SliverToBoxAdapter(
              child: TermsAndConditions(),),
             
               SliverToBoxAdapter(
                child: SizedBox(height: 16)),
               SliverToBoxAdapter(
                child: HaveAnAccountWidget(
                text1: AppStrings.alreadyHaveAnAccount,
                text2: AppStrings.signIn),
              ),
        ],
      ),
    ),
   );
  }
}





