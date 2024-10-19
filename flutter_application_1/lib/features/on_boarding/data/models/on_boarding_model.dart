  import 'package:flutter_application_1/core/utils/app_assets.dart';

class OnBoardingModel{
    final String imagePath;
    final String title;
    final String subtitle;

    OnBoardingModel({
      required this.imagePath,
      required this.title,
      required this.subtitle,
    });
  }


  

  List<OnBoardingModel> onBoardingData = [
    OnBoardingModel(
      imagePath: Assets.imagesOnBoarding1,
      title: "Explore The history with Chronik in a smart way",
      subtitle: "Using our app's history libraries, you can find many historical periods and events",
    ),
    OnBoardingModel(
      imagePath: Assets.imagesOnBoarding2,
      title: "From every corner of the world",
      subtitle: "A big variety of historical events from all over the world",
    ),
    OnBoardingModel(
      imagePath: Assets.imagesOnBoarding,
      title: "Using AI to find the history you are looking for",
      subtitle: "AI powered search engine to find the history you are looking for",
    ),
  ];