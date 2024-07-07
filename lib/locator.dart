import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../data/repository/repository.service.dart';
import '../data/services/local/cache.service.dart';
import '../data/services/local/locale.service.dart';
import '../data/services/local/navigation.service.dart';
import '../data/services/local/storage.service.dart';
import '../data/services/local/theme.service.dart';
import '../data/services/local/user.service.dart';
import '../data/services/web/authentication.service.dart';
import 'screens/auth/forgot-password/forgot-password.vm.dart';
import 'screens/auth/login/login.vm.dart';
import 'screens/auth/signup/signup.vm.dart';
import 'screens/base-vm.dart';
import 'screens/main/home.vm.dart';


GetIt locator = GetIt.I;


setupLocator() {
  registerViewModel();
  setUpServices();
}

// LAZY REGISTER OUR SERVICES
setUpServices(){
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<StorageService>(() => StorageService());
  locator.registerLazySingleton<Repository>(() => Repository());
  locator.registerLazySingleton<AppCache>(() => AppCache());
  locator.registerLazySingleton<UserService>(() => UserService());
  locator.registerLazySingleton<ThemeModel>(() => ThemeModel());
  locator.registerLazySingleton<LocaleService>(() => LocaleService());
  locator.registerLazySingleton<AuthenticationService>(() => AuthenticationService());
}

//REGISTER THE VIEWMODEL
registerViewModel(){
  /* TODO Setup viewModels*/
  locator.registerFactory<BaseViewModel>(() => BaseViewModel());
  locator.registerFactory<LoginViewModel>(() => LoginViewModel());
  locator.registerFactory<SignUpViewModel>(() => SignUpViewModel());
  locator.registerFactory<HomeViewModel>(() => HomeViewModel());
  locator.registerFactory<ForgotPasswordViewModel>(() => ForgotPasswordViewModel());
}