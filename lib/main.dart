import 'package:flutter/material.dart';
import 'package:hype_now/app_widget.dart';
import 'package:hype_now/src/dependencies/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injector();
  runApp(const AppWidget());
}
