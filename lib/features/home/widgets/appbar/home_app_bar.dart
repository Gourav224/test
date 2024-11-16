import 'package:flutter/material.dart';
import 'package:zoc_lms_project/features/ProfileScreen/ProfileScreen.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder<String?>(
                  // Assuming AuthHelper.getName() returns a Future<String?> for the full name.
                  future: AuthHelper.getName(),
                  builder: (context, snapshot) {
                    // If the data is available, show the full name, otherwise show 'ZOC' by default.
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator(); // Optional loading indicator
                    }
                    if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      return Text(
                        'Hi ${snapshot.data},',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      );
                    } else {
                      return Text(
                        'Hi ZOC,', // Default if no name is available
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      );
                    }
                  },
                ),
                Text(
                  "Let's start learning",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                // Navigate to the profile screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20, // Adjust radius as per your needs
                child: Icon(
                  Icons.person, // Replace with an appropriate icon for the avatar
                  color: Colors.blue, // Change color if needed
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}


// Simulating AuthHelper to get user name
class AuthHelper {
  static Future<String?> getName() async {
    // Simulating a network call or async operation
    await Future.delayed(Duration(seconds: 2)); // Simulating delay
    return "John Doe"; // Return the user name or null if not available
  }
}
