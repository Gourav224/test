// lib/features/authentication/login/login.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX for state management
import 'package:zoc_lms_project/core/controller/login_controller.dart';
import 'package:zoc_lms_project/features/authentication/login/widgets/buildPrimaryButton.dart';
import 'package:zoc_lms_project/features/authentication/login/widgets/buildTextField.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the LoginController using GetX
    final loginController = Get.put(LoginController());

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Login Screen',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 2,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 40),
                // Header Section with a smaller logo and more space between elements
                Image.asset(
                  'assets/images/logo-login.png', // Ensure a smaller logo
                  height: 100,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Log in to continue',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 40),

                // Login Form with improved field spacing and styling
                Form(
                  child: Column(
                    children: [
                      // Email Field
                      BuildTextField(
                        controller: loginController.emailController,
                        label: 'Your Email',
                        hint: 'Enter your email',
                        icon: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      // Password Field
                      BuildTextField(
                        controller: loginController.passwordController,
                        label: 'Password',
                        hint: 'Enter your password',
                        icon: Icons.lock,
                        obscureText: true,
                        validator: (password) {
                          if (password == null || password.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Forget Password Button
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to forgot password screen
                      Get.toNamed('/forgot-password');
                    },
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Login Button with improved accessibility and padding
                Obx(() {
                  return loginController.isLoading.value
                      ? BuildPrimaryButton(
                          text: 'Logging In...',
                          onPressed: () {}, // Disable the button while loading
                          isLoading: true,  // Handle loading state in button
                        )
                      : BuildPrimaryButton(
                          text: 'Log In',
                          onPressed: () {
                            loginController.login(context); // Call the login function
                          },
                        );
                }),
                const SizedBox(height: 20),

                // Sign Up Prompt
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          // Navigate to the sign up screen
                          Get.toNamed('/sign-up');
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueAccent,
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
    );
  }
}