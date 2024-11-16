import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoc_lms_project/core/routes/routes.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.black, // Set the status bar to black
            statusBarIconBrightness: Brightness.light, 
          ),
        ),
      ),
      title: 'Agriculture with Arjun',
      initialRoute: AppRoutes.splash,
      getPages: AppRoutes.getPages,
    );
  }
}
