import 'package:flutter/material.dart';
import 'package:hype_now/src/ui/pages/auth/home_page.dart';
import 'package:hype_now/src/ui/pages/auth/signin_page.dart';
import 'package:hype_now/src/ui/pages/auth/signup_page.dart';
import 'package:hype_now/src/ui/pages/auth/splash_page.dart';
import 'package:hype_now/src/ui/pages/auth/welcome_page.dart';
import 'package:hype_now/src/ui/routes/app_routes.dart';

final Map<String, WidgetBuilder> routes = {
  AppRoutes.initialRoute: (context) => const SplashPage(),
  AppRoutes.welcomeRoute: (context) => const WelcomePage(),
  AppRoutes.signinRoute: (context) => const SigninPage(),
  AppRoutes.signupRoute: (context) => const SignupPage(),
  AppRoutes.homeRoute: (context) => const HomePage(),
};
