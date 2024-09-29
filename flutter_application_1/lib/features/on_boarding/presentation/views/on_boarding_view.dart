import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_strings.dart';
import 'package:flutter_application_1/features/on_boarding/presentation/views/on_boarding_widget.dart';

class OnBoardingView extends StatelessWidget{
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context){
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text(AppStrings.skip), 
            ObBoardingWidgetBody(),
          ],
        ),
      ),
    );
  }
}

