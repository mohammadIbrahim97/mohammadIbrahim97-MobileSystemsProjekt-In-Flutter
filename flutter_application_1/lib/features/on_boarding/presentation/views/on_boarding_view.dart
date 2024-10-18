import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_strings.dart';
import 'package:flutter_application_1/core/widgets/custom_button.dart';
import 'package:flutter_application_1/features/on_boarding/presentation/views/widgets/on_boarding_widget_body.dart';
import 'package:flutter_application_1/features/on_boarding/presentation/views/widgets/custom_nav_bar.dart';

class OnBoardingView extends StatelessWidget{
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context){
    return  SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const CustomNavBar(),
              ObBoardingWidgetBody(),
              const SizedBox(height: 88),
              const CustomBtn(text: AppStrings.next,),
              const SizedBox(height: 14),
            ],
          ),
        ),
      ),
    );
  }
}



