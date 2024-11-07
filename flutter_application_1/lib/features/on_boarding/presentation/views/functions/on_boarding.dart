import 'package:flutter_application_1/core/database/cache/cache_helper.dart';
import 'package:flutter_application_1/core/services/service_locator.dart';

void onBoardingVisited(){
    getIt<CacheHelper>().saveData(key: "isOnBoardingVisited",value: true);
}