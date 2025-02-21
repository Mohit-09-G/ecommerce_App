import 'package:get/route_manager.dart';
import 'package:third_app/binding/auth/onboard_binding.dart';
import 'package:third_app/binding/auth/splash_binding.dart';
import 'package:third_app/config/app_route.dart';
import 'package:third_app/presentation/screens/auth/onboard/onboard_page.dart';
import 'package:third_app/presentation/screens/auth/sighin/sighn_in_screen.dart';
import 'package:third_app/presentation/screens/auth/splash/new.dart';
import 'package:third_app/presentation/screens/auth/splash/splash.dart';

class AppPages {
  static final routes = [
    GetPage(
        name: AppRoutes.splashScreen,
        page: () => SplashScreen(),
        binding: SplashBinding()),
    GetPage(name: AppRoutes.helo, page: () => Helo()),
    GetPage(
        name: AppRoutes.onBoardScreen,
        page: () => OnboardPage(),
        binding: OnboardBinding()),
    GetPage(name: AppRoutes.signInScreen, page: () => SighnInScreen()),
  ];
}
