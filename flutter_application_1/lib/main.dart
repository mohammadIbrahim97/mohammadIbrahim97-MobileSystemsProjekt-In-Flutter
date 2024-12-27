import 'package:flutter_application_1/app/chronik_app.dart';
import 'package:flutter_application_1/core/database/cache/cache_helper.dart';
import 'package:flutter_application_1/core/functions/check_state_changes.dart';
import 'package:flutter_application_1/core/services/service_locator.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  checkStateChanges();
  runApp(const Chronik());
}