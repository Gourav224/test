import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for SystemChrome
import 'package:zoc_lms_project/core/utils/colors.dart';
import 'package:zoc_lms_project/features/ProfileScreen/ProfileScreen.dart';
import 'package:zoc_lms_project/features/home/home.dart';
import 'package:zoc_lms_project/features/mycourse/mycourse.dart';

class BottomNavBarExample extends StatefulWidget {
  @override
  _BottomNavBarExampleState createState() => _BottomNavBarExampleState();
}

class _BottomNavBarExampleState extends State<BottomNavBarExample> {
  // To manage the current index
  int _currentIndex = 0;

  // List of pages for navigation
  final List<Widget> _pages = [
    Home(),
    Mycourse(),
    ProfileScreen(),

  ];

  @override
  void initState() {
    super.initState();
    // Set the status bar style to black with light icons
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.black, // Set status bar color to black
        statusBarIconBrightness: Brightness.light, // Set icons to light color
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The body changes based on the current tab selected
      body: _pages[_currentIndex],

      // The Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: AppColors.primary, // Use custom primary color for selected item
        unselectedItemColor: AppColors.black, // Use custom black color for unselected items
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Course',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
