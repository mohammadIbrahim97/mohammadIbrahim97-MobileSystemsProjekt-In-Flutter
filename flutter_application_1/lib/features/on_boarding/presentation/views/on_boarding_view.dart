import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/functions/navigation.dart';
import 'package:flutter_application_1/features/on_boarding/presentation/views/functions/on_boarding.dart';
import 'package:flutter_application_1/features/on_boarding/presentation/views/widgets/get_buttons.dart';
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
               CustomNavBar(
                onTap: () {
                  onBoardingVisited();
                  customNavigate(context, "/signUp");
                },
              ),
              OnBoardingWidgetBody(
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                controller: _controller,
                ), // Corrected class name
              const SizedBox(height: 88),
              GetButtons(
                currentIndex: currentIndex,
                controller: _controller,
              ),  // Corrected class name
              const SizedBox(height: 17),
            ],  
          ),
        ),
      ),
    );
  }
}



