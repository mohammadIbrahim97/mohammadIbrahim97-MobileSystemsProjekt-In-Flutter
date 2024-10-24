import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_strings.dart';
import 'package:flutter_application_1/core/widgets/custom_button.dart';
import 'package:flutter_application_1/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:flutter_application_1/features/on_boarding/presentation/views/widgets/on_boarding_widget_body.dart';
import 'package:flutter_application_1/features/on_boarding/presentation/views/widgets/custom_nav_bar.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
    final PageController _controller = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 40),
              const CustomNavBar(),
              OnBoardingWidgetBody(
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                controller: _controller,
                ), // Corrected class name
              const SizedBox(height: 88),
              currentIndex==onBoardingData.length-1
              ? const Column(
                  children: [
                    CustomBtn(text: "text"),
                    CustomBtn(text: "text"),
                  ],
                )
              : CustomBtn(
                text: AppStrings.next,
                onPressed: () {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.slowMiddle,
                  );
                },
              ),
              const SizedBox(height: 17),
            ],
          ),
        ),
      ),
    );
  }
}