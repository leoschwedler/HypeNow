import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hype_now/src/ui/controllers/theme_controller.dart';

import 'package:hype_now/src/ui/routes/app_routes.dart';
import 'package:hype_now/src/ui/routes/router.dart';
import 'package:hype_now/src/ui/theme/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.instance<ThemeController>();

    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, value, child) {
        return MaterialApp(
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: value ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.initialRoute,
          routes: routes,
        );
      },
    );
  }
}
