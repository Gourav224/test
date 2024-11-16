import 'package:flutter/material.dart';
import 'package:zoc_lms_project/core/data/sample_courses_data.dart';
import 'package:zoc_lms_project/core/utils/colors.dart';
import 'package:zoc_lms_project/features/home/widgets/appbar/home_app_bar.dart';
import 'package:zoc_lms_project/features/home/widgets/latestcourse/latest_courses_section.dart';
import 'package:zoc_lms_project/features/home/widgets/slider/slider_section.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: size.width,
                height: size.height * 0.22,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  gradient: LinearGradient(
                    colors: [AppColors.primary, AppColors.primary],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const HomeAppBar(),
                    const SizedBox(height: 10),
                    const SliderSection(),
                    LatestCoursesSection(
                        courses: courses), // Pass the courses list here
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
