import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_strings.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';
import 'package:flutter_application_1/features/auth/presentation/widgets/custom_check_box.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({ super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
       const CustomCheckBox(),
       Text.rich(TextSpan(children: [
          TextSpan(text: AppStrings.iHaveAgreeToOur,
          style: CustomTextStyles.pacifico400style12
          ),
          TextSpan(
            text: AppStrings.termsAndCondition,
            style: CustomTextStyles.pacifico400style12.copyWith(
              decoration: TextDecoration.underline,
            )

            ),
          ]))
      ],
    );
  }
}
