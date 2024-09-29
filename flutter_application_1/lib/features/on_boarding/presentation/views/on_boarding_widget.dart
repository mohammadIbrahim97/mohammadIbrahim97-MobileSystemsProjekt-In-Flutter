import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';

class ObBoardingWidgetBody extends StatelessWidget{
  const ObBoardingWidgetBody ({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        itemCount: 3,
        itemBuilder: (context, Index){
          return Column(
            children: [
              Image.asset(Assets.imagesOnBoarding1),
            ],
          );
        }
      ),
    );
  }
}