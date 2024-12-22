import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/database/cache/cache_helper.dart';
import 'package:flutter_application_1/core/services/service_locator.dart';
import 'package:flutter_application_1/core/utils/app_strings.dart';
import 'package:flutter_application_1/core/utils/app_text_styles.dart';
import 'package:flutter_application_1/core/functions/navigation.dart';
class SplashView  extends StatefulWidget{
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
  
}

class _SplashViewState extends State<SplashView>{
 @override
void initState() {
  bool isOnBoardingVisisted= getIt<CacheHelper>().getData(key: "isOnBoardingVisited")??false;
   if(isOnBoardingVisisted==true){
    FirebaseAuth.instance.currentUser == null
    ? delayedNavigate(context,"/signUp")
    :delayedNavigate(context, "/home");
   }else{
    delayedNavigate(context,"/onBoarding");
   }
  super.initState();
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
 void delayedNavigate(context,path) {
  Future.delayed(
    const Duration(seconds: 2),
    () {
      customReplacementNavigate(context, path);
    },
  );
  }