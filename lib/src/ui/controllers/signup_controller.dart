import 'package:flutter/material.dart';

class SignupController extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isLoading = false;
  bool _isFormValid = false;

  late AnimationController fadeController;
  late AnimationController slideController;
  late Animation<double> fadeAnimation;
  late Animation<Offset> slideAnimation;

  // Getters
  bool get isPasswordVisible => _isPasswordVisible;
  bool get isConfirmPasswordVisible => _isConfirmPasswordVisible;
  bool get isLoading => _isLoading;
  bool get isFormValid => _isFormValid;

  void initializeAnimations(TickerProvider vsync) {
    fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: vsync,
    );

    slideController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: vsync,
    );

    _setupAnimations();
    _setupFormValidation();

    fadeController.forward();
    slideController.forward();
  }

  void _setupAnimations() {
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
  }

  void _setupFormValidation() {
    nameController.addListener(_validateForm);
    emailController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
    confirmPasswordController.addListener(_validateForm);
  }

  void _validateForm() {
    final isValid =
        nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty &&
        passwordController.text == confirmPasswordController.text &&
        passwordController.text.length >= 8 &&
        _isValidEmail(emailController.text);

    if (_isFormValid != isValid) {
      _isFormValid = isValid;
      notifyListeners();
    }
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Nome é obrigatório';
    }
    if (value.trim().length < 2) {
      return 'Nome deve ter pelo menos 2 caracteres';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email é obrigatório';
    }
    if (!_isValidEmail(value.trim())) {
      return 'Email inválido';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Senha é obrigatória';
    }
    if (value.length < 8) {
      return 'Senha deve ter pelo menos 8 caracteres';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirme sua senha';
    }
    if (value != passwordController.text) {
      return 'As senhas não coincidem';
    }
    return null;
  }

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    notifyListeners();
  }

  Future<void> handleSignup(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    _setLoading(true);

    try {
      // Simular processo de cadastro
      await Future.delayed(const Duration(seconds: 2));

      if (_isLoading) {
        // Verifica se ainda está na tela
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Cadastro realizado com sucesso!'),
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );

        // Navegar para home
        Navigator.of(context).pushNamedAndRemoveUntil(
          '/home', // rota que você quer abrir
          (Route<dynamic> route) => false, // remove todas as anteriores
        );
      }
    } catch (e) {
      if (_isLoading) {
        // Verifica se ainda está na tela
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao realizar cadastro: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      }
    } finally {
      if (_isLoading) {
        // Verifica se ainda está na tela
        _setLoading(false);
      }
    }
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  @override
  void dispose() {
    fadeController.dispose();
    slideController.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
