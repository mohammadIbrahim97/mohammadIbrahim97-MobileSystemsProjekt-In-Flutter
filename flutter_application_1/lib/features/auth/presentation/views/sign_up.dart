import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';
import 'package:flutter_application_1/core/utils/app_strings.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';
import 'package:flutter_application_1/core/widgets/custom_button.dart';
import 'package:flutter_application_1/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter_application_1/features/auth/presentation/widgets/terms_and_condition_widget.dart';
import 'package:flutter_application_1/features/auth/presentation/widgets/wellcome_text_widgets.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({ super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(height: 152)),
          const SliverToBoxAdapter(
            child: WelcomeTextWidget(text: AppStrings.welcome)),
          const SliverToBoxAdapter(
            child: SizedBox(height: 16)),
          const SliverToBoxAdapter(
            child: CustomTextFields(labelText: AppStrings.fristName,)),
          const SliverToBoxAdapter(
            child: CustomTextFields(labelText: AppStrings.lastName,)),
          const SliverToBoxAdapter(
            child: CustomTextFields(labelText: AppStrings.emailAddress,)),
          const SliverToBoxAdapter(
            child: CustomTextFields(labelText: AppStrings.password,)),
            const SliverToBoxAdapter(
              child: TermsAndConditions(),),
              const SliverToBoxAdapter(
                child: SizedBox(height: 88)),
              SliverToBoxAdapter(
                child: CustomBtn(onPressed: () {
                },
                text: AppStrings.signUp,
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 16)),
              const SliverToBoxAdapter(
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



class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({ super.key, required this.text1, required this.text2});
  final String text1,text2;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text.rich( TextSpan(children: 
          [
            TextSpan(
              text: text1,
              style: CustomTextStyles.pacifico400style12,
            ),
            TextSpan(
              text: text2,
              style: CustomTextStyles.pacifico400style12.copyWith(
                color: AppColors.lightGrey,
                decoration: TextDecoration.underline,
              ),
            ),
          ])),
        ],
      ),
    );
  }
}