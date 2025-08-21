import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_spacing.dart';
import '../../../dependencies/injector.dart';
import '../../controllers/signup_controller.dart';
import 'package:hype_now/src/ui/widgets/auth_header.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> with TickerProviderStateMixin {
  late final SignupController _controller;

  @override
  void initState() {
    super.initState();
    _controller = getIt<SignupController>();
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
    final isSmallScreen = size.width < 600;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: const AuthHeader(showBackButton: true),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(
                isSmallScreen ? AppSpacing.md : AppSpacing.xl,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight:
                      constraints.maxHeight -
                      (isSmallScreen ? AppSpacing.md * 2 : AppSpacing.xl * 2),
                ),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Título e ícone
                      FadeTransition(
                        opacity: _controller.fadeAnimation,
                        child: SlideTransition(
                          position: _controller.slideAnimation,
                          child: _buildHeader(textTheme, colorScheme),
                        ),
                      ),

                      SizedBox(height: AppSpacing.xl3),

                      // Formulário
                      FadeTransition(
                        opacity: _controller.fadeAnimation,
                        child: SlideTransition(
                          position: _controller.slideAnimation,
                          child: _buildSignupForm(
                            theme,
                            colorScheme,
                            textTheme,
                            isSmallScreen,
                          ),
                        ),
                      ),

                      SizedBox(height: AppSpacing.xl2),

                      // Link para Sign In
                      FadeTransition(
                        opacity: _controller.fadeAnimation,
                        child: SlideTransition(
                          position: _controller.slideAnimation,
                          child: _buildSignInLink(colorScheme, textTheme),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(TextTheme textTheme, ColorScheme colorScheme) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.person_add_rounded,
            size: 48,
            color: colorScheme.onPrimaryContainer,
          ),
        ),
        SizedBox(height: AppSpacing.lg),
        Text(
          'Criar Conta',
          style: textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        SizedBox(height: AppSpacing.sm),
        Text(
          'Preencha os dados abaixo para começar',
          style: textTheme.bodyLarge?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildSignupForm(
    ThemeData theme,
    ColorScheme colorScheme,
    TextTheme textTheme,
    bool isSmallScreen,
  ) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Container(
          width: isSmallScreen ? double.infinity : 400,
          child: Form(
            key: _controller.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Campo Nome
                _buildNameField(colorScheme, textTheme),
                SizedBox(height: AppSpacing.lg),

                // Campo Email
                _buildEmailField(colorScheme, textTheme),
                SizedBox(height: AppSpacing.lg),

                // Campo Senha
                _buildPasswordField(colorScheme, textTheme),
                SizedBox(height: AppSpacing.lg),

                // Campo Confirmar Senha
                _buildConfirmPasswordField(colorScheme, textTheme),
                SizedBox(height: AppSpacing.xl2),

                // Botão Sign Up
                _buildSignupButton(colorScheme, textTheme),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNameField(ColorScheme colorScheme, TextTheme textTheme) {
    return TextFormField(
      controller: _controller.nameController,
      validator: _controller.validateName,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: 'Nome completo',
        hintText: 'Digite seu nome completo',
        prefixIcon: Icon(
          Icons.person_outline_rounded,
          color: colorScheme.onSurfaceVariant,
        ),
      ),
      style: textTheme.bodyLarge,
    );
  }

  Widget _buildEmailField(ColorScheme colorScheme, TextTheme textTheme) {
    return TextFormField(
      controller: _controller.emailController,
      validator: _controller.validateEmail,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Digite seu email',
        prefixIcon: Icon(
          Icons.email_outlined,
          color: colorScheme.onSurfaceVariant,
        ),
      ),
      style: textTheme.bodyLarge,
    );
  }

  Widget _buildPasswordField(ColorScheme colorScheme, TextTheme textTheme) {
    return TextFormField(
      controller: _controller.passwordController,
      validator: _controller.validatePassword,
      textInputAction: TextInputAction.next,
      obscureText: !_controller.isPasswordVisible,
      decoration: InputDecoration(
        labelText: 'Senha',
        hintText: 'Mínimo 8 caracteres',
        prefixIcon: Icon(
          Icons.lock_outline_rounded,
          color: colorScheme.onSurfaceVariant,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _controller.isPasswordVisible
                ? Icons.visibility_off_rounded
                : Icons.visibility_rounded,
            color: colorScheme.onSurfaceVariant,
          ),
          onPressed: _controller.togglePasswordVisibility,
        ),
      ),
      style: textTheme.bodyLarge,
    );
  }

  Widget _buildConfirmPasswordField(
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return TextFormField(
      controller: _controller.confirmPasswordController,
      validator: _controller.validateConfirmPassword,
      textInputAction: TextInputAction.done,
      obscureText: !_controller.isConfirmPasswordVisible,
      onFieldSubmitted: (_) => _controller.handleSignup(context),
      decoration: InputDecoration(
        labelText: 'Confirmar senha',
        hintText: 'Digite a senha novamente',
        prefixIcon: Icon(
          Icons.lock_outline_rounded,
          color: colorScheme.onSurfaceVariant,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _controller.isConfirmPasswordVisible
                ? Icons.visibility_off_rounded
                : Icons.visibility_rounded,
            color: colorScheme.onSurfaceVariant,
          ),
          onPressed: _controller.toggleConfirmPasswordVisibility,
        ),
      ),
      style: textTheme.bodyLarge,
    );
  }

  Widget _buildSignupButton(ColorScheme colorScheme, TextTheme textTheme) {
    return SizedBox(
      height: 56,
      child: ElevatedButton(
        onPressed:
            _controller.isFormValid && !_controller.isLoading
                ? () => _controller.handleSignup(context)
                : null,
        child:
            _controller.isLoading
                ? SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      colorScheme.onPrimary,
                    ),
                  ),
                )
                : Text(
                  'Criar Conta',
                  style: textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
      ),
    );
  }

  Widget _buildSignInLink(ColorScheme colorScheme, TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Já tem uma conta? ',
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(AppRoutes.signinRoute);
          },
          child: Text(
            'Entrar',
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
