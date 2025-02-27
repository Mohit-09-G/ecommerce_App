import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:third_app/app_pages.dart';
import 'package:third_app/binding/auth/splash_binding.dart';
import 'package:third_app/di/injections.dart' as get_it;
import 'package:third_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await get_it.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).whenComplete(
    () {
      if (kDebugMode) {
        print("Firebase has been initialised");
      }
    },
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: AppPages.routes,
      initialBinding: SplashBinding(),
    );
  }
}
