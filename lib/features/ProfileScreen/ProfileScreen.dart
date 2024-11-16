import 'package:flutter/material.dart';
import 'package:zoc_lms_project/core/global/companysection/company_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue, // Primary color
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header Section with Gradient Background
            Container(
              padding: const EdgeInsets.only(bottom: 32),
              decoration: BoxDecoration(
                color: Colors.grey[50], // Light off-white color
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  // Profile Picture
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 3),
                          ),
                          child: const CircleAvatar(
                            radius: 60,
                            backgroundImage:
                                AssetImage('assets/images/logo.jpg'), // Use any image here
                          ),
                        ),
                      ],
                    ),
                  ),
                  // const SizedBox(height: 20),

                  // Name and Tagline
                  FutureBuilder(
                    future: _getName(), // Mock name retrieval
                    builder: (context, snapshot) {
                      return Column(
                        children: [
                          Text(
                            snapshot.data ?? 'Student Name',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'Student',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),

            // Profile Menu Items in Card
            Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildMenuItem(
                    icon: Icons.person_outline,
                    title: 'Personal Information',
                    onTap: () {
                      // Navigate to personal information screen (just a placeholder)
                    },
                  ),
                  _buildMenuItem(
                    icon: Icons.school_outlined,
                    title: 'My Courses',
                    onTap: () {
                      // Navigate to My Courses screen (just a placeholder)
                    },
                  ),
                  _buildMenuItem(
                    icon: Icons.settings_outlined,
                    title: 'Settings',
                    onTap: () {
                      // Navigate to settings screen (just a placeholder)
                    },
                  ),
                  _buildMenuItem(
                    icon: Icons.logout,
                    title: 'Logout',
                    onTap: () {
                      // Handle logout logic here
                      print('User logged out');
                    },
                    isLogout: true,
                  ),
                ],
              ),
            ),

            // Company Section
            CompanySection(),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    return InkWell(
      onTap: () async {
        // If this is the logout item, perform logout logic
        if (isLogout) {
          print('User logged out');
        } else {
          // Handle other actions if necessary
          onTap();
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.withOpacity(0.1),
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isLogout
                    ? Colors.red.withOpacity(0.1)
                    : Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: isLogout ? Colors.red : Colors.blue,
                size: 20,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: isLogout ? Colors.red : Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> _getName() async {
    // Simulate a delay like fetching data from a backend or database
    await Future.delayed(const Duration(seconds: 2));
    return 'John Doe'; // Return a sample name
  }
}
