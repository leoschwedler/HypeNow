import 'package:flutter/material.dart';
import 'package:hype_now/src/ui/routes/app_routes.dart';
import 'package:hype_now/src/ui/widgets/splash_logo.dart';
import 'package:hype_now/src/ui/widgets/auth_header.dart';
import '../../../dependencies/injector.dart';
import '../../controllers/welcome_controller.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  late final WelcomeController _controller;

  @override
  void initState() {
    super.initState();
    _controller = getIt<WelcomeController>();
    _controller.initializeAnimations(this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: const AuthHeader(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;
          final isWide = maxWidth >= 600;
          final horizontalPadding = isWide ? 32.0 : 20.0;
          final verticalPadding = isWide ? 32.0 : 20.0;
          final logoSize = isWide ? 160.0 : 120.0;
          final contentMaxWidth = isWide ? 520.0 : 440.0;

          return Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: contentMaxWidth),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FadeTransition(
                      opacity: _controller.fadeLogo,
                      child: SlideTransition(
                        position: _controller.slideLogo,
                        child: SplashLogo(
                          size: logoSize,
                          color: colorScheme.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    FadeTransition(
                      opacity: _controller.fadeTitle,
                      child: SlideTransition(
                        position: _controller.slideTitle,
                        child: Column(
                          children: [
                            Text(
                              'Bem-vindo(a)!',
                              style: textTheme.headlineMedium?.copyWith(
                                color: colorScheme.onSurface,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Entre ou crie sua conta para começar.',
                              style: textTheme.bodyLarge?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    FadeTransition(
                      opacity: _controller.fadeButtons,
                      child: SlideTransition(
                        position: _controller.slideButtons,
                        child: _WelcomeActions(
                          onTapSignIn:
                              () => Navigator.of(
                                context,
                              ).pushNamed(AppRoutes.signinRoute),
                          onTapSignUp:
                              () => Navigator.of(
                                context,
                              ).pushNamed(AppRoutes.signupRoute),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _WelcomeActions extends StatelessWidget {
  final VoidCallback onTapSignIn;
  final VoidCallback onTapSignUp;

  const _WelcomeActions({required this.onTapSignIn, required this.onTapSignUp});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _PrimaryButton(
          label: 'Sign In',
          icon: Icons.login,
          onPressed: onTapSignIn,
        ),
        const SizedBox(height: 16),
        _PrimaryButton(
          label: 'Sign Up',
          icon: Icons.person_add,
          onPressed: onTapSignUp,
          tonal: true,
          foregroundColor: colorScheme.onSecondaryContainer,
        ),
      ],
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final bool tonal;
  final Color? foregroundColor;

  const _PrimaryButton({
    required this.label,
    required this.icon,
    required this.onPressed,
    this.tonal = false,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final ButtonStyle style = FilledButton.styleFrom(
      minimumSize: const Size.fromHeight(56),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      textStyle: Theme.of(
        context,
      ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
      foregroundColor: foregroundColor,
      backgroundColor: tonal ? colorScheme.secondaryContainer : null,
    );

    final Widget child = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Icon(icon, size: 22), const SizedBox(width: 10), Text(label)],
    );

    return tonal
        ? FilledButton.tonal(onPressed: onPressed, style: style, child: child)
        : FilledButton(onPressed: onPressed, style: style, child: child);
  }
}
