import 'package:flutter/material.dart';

class SigninController extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isLoading = false;

  // Getters
  bool get isPasswordVisible => _isPasswordVisible;
  bool get isLoading => _isLoading;

  // Animações
  late AnimationController fadeController;
  late AnimationController slideController;
  late Animation<double> fadeAnimation;
  late Animation<Offset> slideAnimation;

  void initializeAnimations(TickerProvider vsync) {
    fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: vsync,
    );

    slideController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: vsync,
    );

    fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: fadeController, curve: Curves.easeInOut));

    slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: slideController, curve: Curves.easeOutCubic),
    );

    // Iniciar animações com delay escalonado
    Future.delayed(const Duration(milliseconds: 200), () {
      fadeController.forward();
    });

    Future.delayed(const Duration(milliseconds: 400), () {
      slideController.forward();
    });
  }

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  Future<void> handleSignIn(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    _setLoading(true);

    // Simular processo de login
    await Future.delayed(const Duration(seconds: 2));

    if (_isLoading) {
      // Verifica se ainda está na tela
      _setLoading(false);
      // Navegar para a tela principal (home)
      Navigator.of(context).pushReplacementNamed('/home');
    }
  }

  void handleForgotPassword(BuildContext context) {
    // TODO: Implementar navegação para tela de recuperação de senha
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Funcionalidade de recuperação de senha em desenvolvimento',
        ),
      ),
    );
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void dispose() {
    fadeController.dispose();
    slideController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
