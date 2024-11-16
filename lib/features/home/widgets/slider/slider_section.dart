import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:zoc_lms_project/core/utils/colors.dart';

class SliderController extends GetxController {
  var isLoading = true.obs;
  var selectedSliderIndex = 0.obs;
  var sliders = <String>[];

  @override
  void onInit() {
    super.onInit();
    // Simulating a network request for sliders
    Future.delayed(Duration(seconds: 2), () {
      sliders.addAll([
        'https://plus.unsplash.com/premium_photo-1674641194949-e154719cdc02?fm=jpg&q=60&w=3000',
        'https://plus.unsplash.com/premium_photo-1674641194949-e154719cdc02?fm=jpg&q=60&w=3000',
        'https://plus.unsplash.com/premium_photo-1674641194949-e154719cdc02?fm=jpg&q=60&w=3000',
      ]);
      isLoading.value = false;
    });
  }

  void changeSliderIndex(int index) {
    selectedSliderIndex.value = index;
  }
}

class SliderSection extends StatelessWidget {
  const SliderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final sliderController = Get.put(SliderController());
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 12,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() {
          // Ensure a fixed height for the container, even during loading
          double containerHeight = 150;

          // Check if data is still loading
          if (sliderController.isLoading.value) {
            return Center(
              child: SizedBox(
                height: containerHeight,
                child: SpinKitFadingCircle(
                  // Modern loading spinner
                  color: AppColors.primary, // Set color to your theme
                  size: 50.0, // Adjust size of the spinner
                ),
              ),
            );
          }

          // If no sliders available, show fallback content
          if (sliderController.sliders.isEmpty) {
            return Column(
              children: [
                Container(
                  width: size.width * 0.90,
                  height: containerHeight,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage('https://via.placeholder.com/300'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DotIndicator(isSelected: true),
                  ],
                ),
              ],
            );
          }

          // When sliders are available, show the carousel
          return Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: containerHeight,
                  initialPage: sliderController.selectedSliderIndex.value,
                  onPageChanged: (index, reason) {
                    sliderController.changeSliderIndex(index);
                  },
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 1.0,
                ),
                items: sliderController.sliders.map((sliderImage) {
                  return Builder(
                    builder: (BuildContext context) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          sliderImage,
                          fit: BoxFit.cover,
                          width: size.width * 0.90,
                          height: containerHeight,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  sliderController.sliders.length,
                  (index) => GestureDetector(
                    onTap: () => sliderController.changeSliderIndex(index),
                    child: DotIndicator(
                        isSelected:
                            sliderController.selectedSliderIndex.value ==
                                index),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  final bool isSelected;

  const DotIndicator({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color:
            isSelected ? AppColors.primary : AppColors.primary.withOpacity(0.4),
        shape: BoxShape.circle,
      ),
    );
  }
}
