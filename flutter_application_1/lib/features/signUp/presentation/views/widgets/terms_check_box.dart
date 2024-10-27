// lib/features/welcome/presentation/widgets/terms_checkbox.dart

import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';

class TermsCheckbox extends StatefulWidget {
  const TermsCheckbox({super.key});

  @override
  _TermsCheckboxState createState() => _TermsCheckboxState();
}

class _TermsCheckboxState extends State<TermsCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (bool? newValue) {
            setState(() {
              isChecked = newValue ?? false;
            });
          },
        ),
        const Expanded(
          child: Text(AppStrings.iHaveAgreeToOurTermsAndCondition),
        ),
      ],
    );
  }
}
