import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/database/cache/cache_helper.dart';
import 'package:flutter_application_1/core/routes/app_router.dart';
import 'package:flutter_application_1/core/services/service_locator.dart';
import 'package:flutter_application_1/core/utils/app_colors.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  runApp(const Chronik());
}

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
