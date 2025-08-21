import 'package:flutter/material.dart';
import 'package:hype_now/src/ui/pages/home_page.dart';
import 'package:hype_now/src/ui/pages/signin_page.dart';
import 'package:hype_now/src/ui/pages/signup_page.dart';
import 'package:hype_now/src/ui/pages/splash_page.dart';
import 'package:hype_now/src/ui/pages/welcome_page.dart';
import 'package:hype_now/src/ui/routes/app_routes.dart';

final Map<String, WidgetBuilder> routes = {
  AppRoutes.initialRoute: (context) => const SplashPage(),
  AppRoutes.welcomeRoute: (context) => const WelcomePage(),
  AppRoutes.signinRoute: (context) => const SigninPage(),
  AppRoutes.signupRoute: (context) => const SignupPage(),
  AppRoutes.homeRoute: (context) => const HomePage(),
};
