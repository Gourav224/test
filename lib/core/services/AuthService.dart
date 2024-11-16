// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:zoc_lms_project/core/utils/appUrls.dart';

// class AuthService {
//   // Hardcoded demo credentials for quick testing
//   static const String demoEmail = "demo@example.com";
//   static const String demoPassword = "demoPassword";

//   // Login function
//   static Future<bool> login(String email, String password) async {
//     final pref = await SharedPreferences.getInstance();

//     // Check for demo credentials
//     if (email == demoEmail && password == demoPassword) {
//       pref.setString('token', 'demo_token');
//       pref.setString('email', demoEmail);
//       return true; // Return true if demo login is successful
//     }

//     // Prepare the request body
//     final Map<String, dynamic> requestData = {
//       'email': email,
//       'password': password,
//     };

//     // Make the login API call
//     final response = await http.post(
//       AppUrls.login,
//       headers: {
//         'Content-Type': 'application/json', // Set header to application/json
//       },
//       body: jsonEncode(requestData),
//     );

//     if (response.statusCode == 200) {
//       final responseData = jsonDecode(response.body);

//       // Save user data and token in SharedPreferences
//       if (responseData['success']) {
//         pref.setString('token', responseData['token']);
//         pref.setString('userId', responseData['user']['id']);
//         pref.setString('fullName', responseData['user']['fullName']);
//         pref.setString('email', responseData['user']['email']);
//         pref.setString('phoneNumber', responseData['user']['phoneNumber']);
//         pref.setString('gender', responseData['user']['gender']);
//         pref.setBool('isSubscribed', responseData['user']['isSubscribed']);
//         pref.setBool('isVerified', responseData['user']['isVerified']);
//         return true;
//       } else {
//         // Login failed (show error message if needed)
//         return false;
//       }
//     } else {
//       // Server error or connection issue
//       return false;
//     }
//   }

//   // Logout function to clear SharedPreferences
//   static Future<void> logout() async {
//     final pref = await SharedPreferences.getInstance();
//     await pref.clear(); // Clear all stored data
//   }
// }


// Ensure you're importing required dependencies
import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:zoc_lms_project/core/utils/appUrls.dart';

class AuthService {
  static const String demoEmail = "demo@example.com";
  static const String demoPassword = "demoPassword";

  static Future<bool> login(String email, String password) async {
    // final pref = await SharedPreferences.getInstance();

    // Check for hard-coded demo credentials
    if (email == demoEmail && password == demoPassword) {
      // pref.setString('token', 'demo_token');
      return true;
    }

    final Map<String, dynamic> requestData = {
      'email': email,
      'password': password,
    };

    try {
      final response = await http.post(
AppUrls.login,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestData),
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        if (responseBody['success']) {
          // Save user details
          // pref.setString('token', responseBody['token'] ?? '');
          // pref.setString('userId', responseBody['user']['id'] ?? '');
          // pref.setString('fullName', responseBody['user']['fullName'] ?? '');
          // pref.setString('email', responseBody['user']['email'] ?? '');
          // pref.setString('phoneNumber', responseBody['user']['phoneNumber'] ?? '');
          // pref.setString('gender', responseBody['user']['gender'] ?? '');
          // pref.setBool('isSubscribed', responseBody['user']['isSubscribed'] ?? false);
          // pref.setBool('isVerified', responseBody['user']['isVerified'] ?? false);
          
          return true;
        } else {
          return false;
        }
      } else {
        // If the request failed
        return false;
      }
    } catch (e) {
      print("Error during login: $e");
      return false;
    }
  }
}
