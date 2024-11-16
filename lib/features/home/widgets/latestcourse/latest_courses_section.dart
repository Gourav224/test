import 'package:flutter/material.dart';
import 'package:zoc_lms_project/core/utils/colors.dart';
import 'package:zoc_lms_project/features/home/widgets/customcard/course_card_widget.dart';

class LatestCoursesSection extends StatelessWidget {
  const LatestCoursesSection({super.key, required this.courses});

  final List<Map<String, dynamic>> courses;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          // horizontal: 4.0,
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section title and "View All" button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Latest Courses',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.black.withOpacity(0.85),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Implement the "View All" button functionality
                },
                child: Text(
                  'View All',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Responsive Grid View for Courses
          GridView.builder(
            shrinkWrap: true, // Make the GridView shrink-wrap its content
            physics:
                const NeverScrollableScrollPhysics(), // Disable GridView scrolling
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16, // Adjusted to reduce space between cards
              childAspectRatio: 0.85,
            ),
            itemCount: courses.length,
            itemBuilder: (context, index) {
              return CourseCardWidget(course: courses[index]);
            },
          ),
        ],
      ),
    );
  }
}
