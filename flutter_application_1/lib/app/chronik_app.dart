import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/routes/app_router.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';

class Chronik extends StatelessWidget {
  const Chronik ({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp.router(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.offWhite
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  } 
}
