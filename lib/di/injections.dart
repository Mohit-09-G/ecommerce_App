import 'package:get_it/get_it.dart';
import 'package:third_app/presentation/controller/auth/onboard/onboard_contoller.dart';
import 'package:third_app/presentation/controller/auth/splash/splash_contoller.dart';

final GetIt getIt = GetIt.asNewInstance();

Future<void> init() async {
  getIt.registerFactory<SplashContoller>(() => SplashContoller());
  getIt.registerFactory<OnboardContoller>(() => OnboardContoller());
}
