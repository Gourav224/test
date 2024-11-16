import 'package:flutter/material.dart';
import 'package:zoc_lms_project/core/controller/signup_controller.dart';
import 'package:zoc_lms_project/core/validation/signup_validation.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late final SignupControllers controllers;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controllers = useSignupControllers(); // Initialize controllers
  }

  @override
  void dispose() {
    // Dispose the controllers when the widget is disposed
    controllers.nameController.dispose();
    controllers.emailController.dispose();
    controllers.passwordController.dispose();
    controllers.confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Create Account'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              // Title Section
              const Text(
                'Sign Up to Get Started',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 16),

              // Full Name TextField
              _buildTextField(
                controller: controllers.nameController,
                label: 'Full Name',
                icon: Icons.person,
                validator: validateName,
              ),
              const SizedBox(height: 16),

              // Email TextField
              _buildTextField(
                controller: controllers.emailController,
                label: 'Email',
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                validator: validateEmail,
              ),
              const SizedBox(height: 16),

              // Password TextField
              _buildTextField(
                controller: controllers.passwordController,
                label: 'Password',
                icon: Icons.lock,
                obscureText: true,
                validator: validatePassword,
              ),
              const SizedBox(height: 16),

              // Confirm Password TextField
              _buildTextField(
                controller: controllers.confirmPasswordController,
                label: 'Confirm Password',
                icon: Icons.lock,
                obscureText: true,
                validator: (value) => validateConfirmPassword(
                    controllers.passwordController, value),
              ),
              const SizedBox(height: 20),

              // Terms and Conditions Checkbox
              Row(
                children: [
                  Checkbox(value: false, onChanged: (bool? value) {}),
                  const Expanded(
                    child: Text(
                      'I agree to the Terms and Conditions',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Sign Up Button
              _buildPrimaryButton(
                text: 'Sign Up',
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Signing up...')),
                    );
                  }
                },
              ),
              const SizedBox(height: 20),

              // Already have an account? Login
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: const Text(
                    'Already have an account? Login',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(fontSize: 16, color: Colors.blueAccent),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blueAccent, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
        ),
        prefixIcon: Icon(icon, color: Colors.blueAccent),
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
    );
  }

  Widget _buildPrimaryButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
