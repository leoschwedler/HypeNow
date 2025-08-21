import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hype_now/src/ui/controllers/splash_controller.dart';
import 'package:hype_now/src/ui/routes/app_routes.dart';
import 'package:hype_now/src/ui/theme/app_spacing.dart';
import 'package:hype_now/src/ui/widgets/splash_logo.dart';
import 'package:hype_now/src/ui/widgets/splash_subtitle.dart';
import 'package:hype_now/src/ui/widgets/splash_title.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final SplashController _controller;

  @override
  void initState() {
    super.initState();
    _controller = GetIt.instance<SplashController>();
    _controller.init(vsync: this);
    _controller.playAnimations();
    _controller.startNavigationTimer(
      onNavigate: () {
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, AppRoutes.welcomeRoute);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    final logoSize = size.width * 0.25;
    const maxLogoSize = 120.0;
    final responsiveLogoSize = logoSize.clamp(80.0, maxLogoSize);

    return Scaffold(
      backgroundColor: colorScheme.background,

      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.screenPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: Listenable.merge([
                    _controller.fadeAnimation,
                    _controller.scaleAnimation,
                  ]),
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _controller.scaleAnimation.value,
                      child: Opacity(
                        opacity: _controller.fadeAnimation.value,
                        child: SplashLogo(
                          size: responsiveLogoSize,
                          color: colorScheme.primary,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: AppSpacing.md),
                AnimatedBuilder(
                  animation: _controller.fadeAnimation,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _controller.fadeAnimation.value,
                      child: const SplashTitle(text: 'Hype Now'),
                    );
                  },
                ),
                const SizedBox(height: AppSpacing.md),
                AnimatedBuilder(
                  animation: _controller.fadeAnimation,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _controller.fadeAnimation.value,
                      child: const SplashSubtitle(
                        text: 'Sua plataforma de Festas',
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
