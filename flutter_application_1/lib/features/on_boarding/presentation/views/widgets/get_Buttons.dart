import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/functions/navigation.dart';
import 'package:flutter_application_1/core/utils/app_strings.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';
import 'package:flutter_application_1/core/widgets/custom_button.dart';
import 'package:flutter_application_1/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:flutter_application_1/features/on_boarding/presentation/views/functions/on_boarding.dart';

class GetButtons extends StatelessWidget {
  const GetButtons(
    {super.key, required this.currentIndex, required this.controller}
  );
  final int currentIndex;
  final PageController controller;
  
  @override
  Widget build(BuildContext context) {
      if (currentIndex == onBoardingData.length - 1) {
        
    return Column(
                  children: [
                    CustomBtn(
                      text: AppStrings.createAccount,
                      onPressed: () {
                        onBoardingVisited();
                        customNavigate(context, "/signUp");
                      },
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        onBoardingVisited();
                        customNavigate(context, "/signIn");
                      },
                      child: Text( 
                      AppStrings.loginNow,
                      style: CustomTextStyles.poppins300style16.copyWith(
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                ],
      );
    }else{
      return CustomBtn(
            text: AppStrings.next,
            onPressed: () {
            controller.nextPage(
            duration: const Duration(milliseconds: 200),
            curve: Curves.slowMiddle,
          );
        },
      );
    }
  }
}
