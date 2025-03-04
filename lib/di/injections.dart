import 'package:get_it/get_it.dart';
import 'package:third_app/data/api/auth_remote_data_source.dart';
import 'package:third_app/data/repositorie/auth/auth_repository_impl.dart';
import 'package:third_app/domain/repositories/auth/auth_repository.dart';
import 'package:third_app/domain/usecases/create_account_usecases.dart';
import 'package:third_app/domain/usecases/do_login_with_email_password.dart';
import 'package:third_app/presentation/controller/auth/appbar/profile_screen_controller.dart';

import 'package:third_app/presentation/controller/auth/forgetPasword/forget_password_controller.dart';
import 'package:third_app/presentation/controller/auth/home/home_screen_controller.dart';
import 'package:third_app/presentation/controller/auth/onboard/onboard_contoller.dart';
import 'package:third_app/presentation/controller/auth/sighn_in/sighn_in_controller.dart';
import 'package:third_app/presentation/controller/auth/sign_up/sign_up_controller.dart';
import 'package:third_app/presentation/controller/auth/splash/splash_contoller.dart';

final GetIt getIt = GetIt.instance;
Future<void> init() async {
  // Controllers
  getIt.registerFactory<SplashContoller>(() => SplashContoller());
  getIt.registerFactory<OnboardContoller>(() => OnboardContoller());
  getIt.registerFactory<HomeScreenController>(() => HomeScreenController());
  getIt.registerFactory<ForgetpasswordController>(
      () => ForgetpasswordController());
  getIt.registerFactory<ProfileScreenController>(
      () => ProfileScreenController());
  // getIt.registerFactory<DisplayPageCotroller>(() => DisplayPageCotroller());

  // Data sources
  getIt.registerLazySingleton(() => AuthRemoteDataSourceImpl());

  // Repositories
  getIt.registerLazySingleton<AuthRepository>(
    () =>
        AuthRepositoryImpl(remotedatasource: getIt<AuthRemoteDataSourceImpl>()),
  );

  // Use cases
  getIt.registerFactory<CreateAccountUsecases>(
      () => CreateAccountUsecases(repository: getIt<AuthRepository>()));
  getIt.registerFactory<DoLoginWithEmailPassword>(
      () => DoLoginWithEmailPassword(repository: getIt<AuthRepository>()));

  // Controllers that depend on use cases
  getIt.registerFactory<SignUpController>(
      () => SignUpController(getIt<CreateAccountUsecases>()));
  getIt.registerFactory<SighnInController>(
      () => SighnInController(doLoginWithEmailPassword: getIt()));
}
