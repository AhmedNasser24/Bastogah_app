import 'package:bastogah_app/core/api/end_point.dart';
import 'package:bastogah_app/core/dependency_injection/get_it_setup.dart';
import 'package:bastogah_app/core/extenstion/media_query_extension.dart';
import 'package:bastogah_app/core/widgets/custom_toast/show_toast.dart';
import 'package:bastogah_app/core/routing/route_name.dart';
import 'package:bastogah_app/core/theme/app_images.dart';
import 'package:bastogah_app/features/user_feature/home/presentation/manager/sliders_cubit/sliders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/widgets/custom_cached_image.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  final List<String> imgList = const [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNURVD38XtPap6C6sf4u5APb0uFk8G9PQ7wA&s"
        "1760948317782-95611-image.jpg",
    AppImages.imagesPizzaHut,
    "1760948317782-95611-image.jpg",
    AppImages.imagesBurger,
    AppImages.imagesAsianFood,
    "1760948317782-95611-image.jpg",
    AppImages.imagesBurger,
  ];

  int _currentIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SlidersCubit, SlidersState>(
      listener: (context, state) {
        if (state is SlidersFailure) {
          CustomFlutterToast.showErrorToast(state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is SlidersLoading || state is SlidersInitial) {
          return const Center(child: CircularProgressIndicator());
        }
        return Column(
          children: [
            CarouselSlider(
              carouselController: _carouselController,
              items: imgList
                  .map(
                    (item) => GestureDetector(
                      onTap: () {
                        context.push(RouteName.userStores);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          // child: Image.asset(item, fit: BoxFit.cover),
                          child: CustomCachedImage(imagePath: item),
                        ),
                      ),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: context.screenWidth > 600
                    ? 190
                    : 160.0, // Removed to use aspect ratio

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
      },
    );
  }
}
