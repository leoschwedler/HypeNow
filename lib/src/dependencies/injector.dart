import 'package:get_it/get_it.dart';
import 'package:hype_now/src/ui/controllers/theme_controller.dart';
import 'package:hype_now/src/ui/controllers/splash_controller.dart';
import 'package:hype_now/src/ui/controllers/signin_controller.dart';
import 'package:hype_now/src/ui/controllers/signup_controller.dart';
import 'package:hype_now/src/ui/controllers/welcome_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> injector() async {
  getIt.registerSingleton<ThemeController>(
    ThemeController(sharedPreferences: await SharedPreferences.getInstance()),
  );
  getIt.registerFactory<SplashController>(() => SplashController());
  getIt.registerFactory<SigninController>(() => SigninController());
  getIt.registerFactory<SignupController>(() => SignupController());
  getIt.registerFactory<WelcomeController>(() => WelcomeController());
}
