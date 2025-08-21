import 'package:flutter/material.dart';
import 'package:hype_now/src/ui/routes/app_routes.dart';
import 'package:hype_now/src/ui/theme/app_spacing.dart';
import 'package:hype_now/src/ui/widgets/splash_logo.dart';
import 'package:hype_now/src/ui/widgets/auth_header.dart';
import '../../../dependencies/injector.dart';
import '../../controllers/signin_controller.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> with TickerProviderStateMixin {
  late final SigninController _controller;

  @override
  void initState() {
    super.initState();
    _controller = getIt<SigninController>();
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
    final size = MediaQuery.of(context).size;

    final logoSize = size.width * 0.25;
    const maxLogoSize = 120.0;
    final responsiveLogoSize = logoSize.clamp(80.0, maxLogoSize);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: const AuthHeader(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppSpacing.screenPadding),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight:
                  size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom,
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo e título
                  FadeTransition(
                    opacity: _controller.fadeAnimation,
                    child: Column(
                      children: [
                        SplashLogo(
                          size: responsiveLogoSize,
                          color: colorScheme.primary,
                        ),
                        SizedBox(height: AppSpacing.md),
                        Text(
                          'Bem-vindo de volta',
                          style: textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        SizedBox(height: AppSpacing.sm),
                        Text(
                          'Faça login para continuar',
                          style: textTheme.bodyLarge?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: AppSpacing.xl3),

                  // Formulário de login
                  SlideTransition(
                    position: _controller.slideAnimation,
                    child: FadeTransition(
                      opacity: _controller.fadeAnimation,
                      child: Form(
                        key: _controller.formKey,
                        child: Column(
                          children: [
                            // Campo de email
                            TextFormField(
                              controller: _controller.emailController,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                hintText: 'Digite seu email',
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, digite seu email';
                                }
                                if (!RegExp(
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                ).hasMatch(value)) {
                                  return 'Por favor, digite um email válido';
                                }
                                return null;
                              },
                            ),

                            SizedBox(height: AppSpacing.lg),

                            // Campo de senha
                            TextFormField(
                              controller: _controller.passwordController,
                              obscureText: !_controller.isPasswordVisible,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                labelText: 'Senha',
                                hintText: 'Digite sua senha',
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: colorScheme.onSurfaceVariant,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _controller.isPasswordVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                  onPressed:
                                      _controller.togglePasswordVisibility,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, digite sua senha';
                                }
                                if (value.length < 6) {
                                  return 'A senha deve ter pelo menos 6 caracteres';
                                }
                                return null;
                              },
                            ),

                            SizedBox(height: AppSpacing.md),

                            // Link "Esqueci minha senha"
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed:
                                    () => _controller.handleForgotPassword(
                                      context,
                                    ),
                                child: Text(
                                  'Esqueci minha senha?',
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: colorScheme.primary,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: AppSpacing.xl),

                            // Botão de login
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed:
                                    _controller.isLoading
                                        ? null
                                        : () =>
                                            _controller.handleSignIn(context),
                                child:
                                    _controller.isLoading
                                        ? SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                  colorScheme.onPrimary,
                                                ),
                                          ),
                                        )
                                        : Text(
                                          'Entrar',
                                          style: textTheme.labelLarge?.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: AppSpacing.xl2),

                  // Link para cadastro
                  FadeTransition(
                    opacity: _controller.fadeAnimation,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Não tem uma conta? ',
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(
                              context,
                            ).pushReplacementNamed(AppRoutes.signupRoute);
                          },
                          child: Text(
                            'Cadastre-se',
                            style: textTheme.bodyMedium?.copyWith(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
