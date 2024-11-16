
import 'package:zoc_lms_project/core/utils/appConfig.dart';

class AppUrls {
  static const String apiVersion = 'v1';
  static const String apiUrl = '${AppConfig.baseUrl}';
  static Uri login = Uri.parse('$apiUrl/api/auth/login');
  static Uri register = Uri.parse('$apiUrl/api/students/register');
  static Uri otp = Uri.parse('$apiUrl/api/students/verify-code');
  static Uri resendverifymail =
      Uri.parse('$apiUrl/api/students/resend-verification-mail');
  static Uri learningdetail = Uri.parse('$apiUrl/api/courses');
}