import 'package:flutter/material.dart';
import 'package:zoc_lms_project/core/data/sample_courses_data.dart';
import 'package:zoc_lms_project/features/home/widgets/customcard/course_card_widget.dart';

class Mycourse extends StatelessWidget {
  const Mycourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Courses'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: courses.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: index > 0
                  ? const EdgeInsets.only(top: 16.0)
                  : EdgeInsets.zero,
              child: CourseCardWidget(course: courses[index]),
            );
          },
        ),
      ),
    );
  }
}
