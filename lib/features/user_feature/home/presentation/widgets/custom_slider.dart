import 'package:bastogah_app/core/extenstion/media_query_extension.dart';
import 'package:bastogah_app/core/theme/app_images.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  final List<String> imgList = const [
    AppImages.imagesPizzaHut,
    AppImages.imagesBurger,
    AppImages.imagesAsianFood,
    AppImages.imagesBurger,
  ];

  int _currentIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          items: imgList
              .map(
                (item) => Container(
                  margin: const EdgeInsets.all(5.0),
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    child: Image.asset(item, fit: BoxFit.cover),
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
            height: context.screenWidth > 800
                ? 220
                : 180.0, // Removed to use aspect ratio

            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.8,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        const Gap(16),
        AnimatedSmoothIndicator(
          activeIndex: _currentIndex,
          count: imgList.length,
          effect: const ExpandingDotsEffect(
            dotWidth: 10,
            dotHeight: 10,
          ), // You can customize this further
          onDotClicked: (index) {
            _carouselController.animateToPage(
              index,
              duration: const Duration(milliseconds: 800),
            );
          },
        ),
      ],
    );
  }
}
