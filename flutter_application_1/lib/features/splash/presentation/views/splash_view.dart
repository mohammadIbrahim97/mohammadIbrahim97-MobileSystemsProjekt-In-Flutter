import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/app_strings.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';
import 'package:go_router/go_router.dart';

class SplashView  extends StatefulWidget{
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
  
}

class _SplashViewState extends State<SplashView>{
 @override
void initState() {
  super.initState();
  Future.delayed(
    const Duration(seconds: 2),
    () {
      if (mounted) {
        GoRouter.of(context).push("/onBoarding");
      }
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          AppStrings.appName,
          style: CustomTextStyles.pacifico400style64,
        ),
      ),
    );
  }
}