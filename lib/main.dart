import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:third_app/app_pages.dart';
import 'package:third_app/binding/auth/splash_binding.dart';
import 'package:third_app/di/injections.dart' as get_it;

void main() async {
  await get_it.init();
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
