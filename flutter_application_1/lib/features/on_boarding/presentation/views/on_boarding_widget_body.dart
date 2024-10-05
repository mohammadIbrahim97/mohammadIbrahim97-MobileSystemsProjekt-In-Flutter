import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_assets.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';
import 'package:flutter_application_1/features/on_boarding/presentation/views/widgets/custom_smooth_page_indicator.dart';

class ObBoardingWidgetBody extends StatelessWidget{
  ObBoardingWidgetBody ({super.key});
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: _controller,
        itemCount: 3,
        // ignore: non_constant_identifier_names
        itemBuilder: (context, Index){
          return Column(
            children: [
              Image.asset(Assets.imagesOnBoarding1),
              const SizedBox(height: 24),
              CustomSmoothPageIndicator(controller: _controller),
              const SizedBox(height: 32),
              Text(
                "Explore The history with Chronik in a smart way",
                style: CustomTextStyles.poppins500style24.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
              Text(
                "Using our app's history libraries, you can find many historical periods and events",
                style: CustomTextStyles.poppins300style16,
                textAlign: TextAlign.center,
                ),
            ],
          );
        }
      ),
    );
  }
}
