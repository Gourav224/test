import 'package:flutter/material.dart';

String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your full name';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  }
  // Simple email validation pattern
  final emailRegExp = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
  if (!emailRegExp.hasMatch(value)) {
    return 'Please enter a valid email address';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  }
  if (value.length < 6) {
    return 'Password must be at least 6 characters long';
  }
  return null;
}

String? validateConfirmPassword(TextEditingController passwordController, String? value) {
  if (value == null || value.isEmpty) {
    return 'Please confirm your password';
  }
  if (value != passwordController.text) {
    return 'Passwords do not match';
  }
  return null;
}
