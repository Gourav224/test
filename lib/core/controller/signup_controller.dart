import 'package:flutter/material.dart';

class SignupControllers {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  SignupControllers({
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });
}

SignupControllers useSignupControllers() {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  return SignupControllers(
    nameController: nameController,
    emailController: emailController,
    passwordController: passwordController,
    confirmPasswordController: confirmPasswordController,
  );
}
