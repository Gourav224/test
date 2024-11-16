// lib/core/controller/login_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoc_lms_project/core/services/AuthService.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  var isLoading = false.obs;

  Future<void> login(BuildContext context) async {
    final email = emailController.text;
    final password = passwordController.text;

    // Ensure email and password are not null or empty before calling the login function
    if (email.isEmpty || password.isEmpty) {
      // Show error if any field is empty
      Get.snackbar('Error', 'Email and Password are required!');
      return;
    }

    isLoading.value = true;
    
    try {
      final isLoggedIn = await AuthService.login(email, password);
      
      isLoading.value = false;

      if (isLoggedIn) {
        Get.offAllNamed('/home');
      } else {
        Get.dialog(
          AlertDialog(
            title: const Text('Login Failed'),
            content: const Text('Invalid email or password. Please try again.'),
            actions: [
              TextButton(
                onPressed: () => Get.back(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      // Handle unexpected errors
      isLoading.value = false;
      Get.dialog(
        AlertDialog(
          title: const Text('Error'),
          content: const Text('An unexpected error occurred. Please try again later.'),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
