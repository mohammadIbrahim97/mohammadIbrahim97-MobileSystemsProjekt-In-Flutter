import 'package:flutter_application_1/core/database/cache/cache_helper.dart';
import 'package:flutter_application_1/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupServiceLocator(){
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerSingleton<AuthCubit>(AuthCubit());
}