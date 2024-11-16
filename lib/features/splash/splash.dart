import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoc_lms_project/core/utils/colors.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Set up the animation controller
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    // Fade-in animation
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    // Scale animation for logo and text
    _scaleAnimation = Tween<double>(begin: 0.7, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    // Trigger navigation after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed('/signup'); // Navigate to the sign-up screen
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Logo with a modern design (using a gradient shadow for style)
                Image.asset('assets/images/logo-login.png', width: 150),
                const SizedBox(height: 20),
                // Main Title (use bolder, large text for impact)
                const Text(
                  'Agriculture with Arjun',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 10, 58, 250),
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 10),
                // Subtitle (lighter, smaller text)
                const Text(
                  'Empowering Future Farmers, One Step at a Time',
                  style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    color: Color.fromARGB(255, 10, 58, 250),
                    fontFamily: 'Poppins',
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
