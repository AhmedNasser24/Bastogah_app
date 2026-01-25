import 'dart:developer';

import 'package:bastogah_app/core/enums/request_state_enum.dart';
import 'package:bastogah_app/core/extenstion/media_query_extension.dart';
import 'package:bastogah_app/core/theme/app_images.dart';
import 'package:bastogah_app/features/user_feature/home/presentation/manager/home_cubit/user_home_cubit.dart';
import 'package:bastogah_app/features/user_feature/home/data/model/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../../core/widgets/custom_cached_image.dart';
import '../../../../../core/widgets/custom_skeletonizer.dart';
import 'video_slider_item.dart';
import 'youtube_slider_item.dart';

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
  ];

  int _currentIndex = 0;
  bool _isVideoPlaying = false;
  bool _isSliderVisible = false;
  List<SliderModel> _sliderList = [];
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  @override
  void initState() {
    super.initState();
  }

  bool _isCurrentSlideVideo() {
    if (_currentIndex < 0 || _currentIndex >= _sliderList.length) return false;
    final item = _sliderList[_currentIndex];
    return item.videoLink != null && item.videoLink!.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserHomeCubit, UserHomeState>(
      listener: (context, state) {},
      buildWhen: (previous, current) {
        return current.sliderRequestState != previous.sliderRequestState;
      },
      builder: (context, state) {
        if (state.sliderRequestState == RequestStateEnum.loading ||
            state.sliderRequestState == RequestStateEnum.initial ||
            state.sliderRequestState == RequestStateEnum.failure) {
          return Column(
            children: [
              CarouselSlider(
                carouselController: _carouselController,
                items: imgList
                    .map(
                      (image) => Container(
                        margin: const EdgeInsets.all(5.0),
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          child: CustomSkeletonizer(
                            child: Image.asset(image, fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    )
                    .toList(),
                options: _carouselOptions(context),
              ),
              const Gap(16),
              AnimatedSmoothIndicator(
                activeIndex: _currentIndex,
                count: imgList.length,
                effect: const ExpandingDotsEffect(dotWidth: 10, dotHeight: 10),
                onDotClicked: (index) {
                  _carouselController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 800),
                  );
                },
              ),
            ],
          );
        } else if (state.sliderRequestState == RequestStateEnum.success) {
          _sliderList = state.sliderList;
          return VisibilityDetector(
            key: const Key('home_slider'),
            onVisibilityChanged: (info) {
              final visible = info.visibleFraction > 0.3;
              if (_isSliderVisible != visible) {
                setState(() {
                  _isSliderVisible = visible;
                  log("_isSliderVisible: $_isSliderVisible");
                });
              }
            },
            child: Column(
              children: [
                CarouselSlider(
                  carouselController: _carouselController,
                  items: [
                    VideoSliderItem(
                      isActive: _currentIndex == 0,
                      isVisible: _isSliderVisible,
                    ),
                    ..._sliderList.asMap().entries.map((entry) {
                      final index = entry.key;
                      final item = entry.value;

                      if (item.videoLink != null &&
                          item.videoLink!.isNotEmpty) {
                        return YoutubeSliderItem(
                          videoUrl: item.videoLink!,
                          isActive: index == _currentIndex,
                          isSliderVisible: _isSliderVisible,
                          onVideoPlayStateChanged: (playing) {
                            if (_isVideoPlaying != playing) {
                              setState(() => _isVideoPlaying = playing);
                            }
                          },
                          onVideoFinished: () {
                            _carouselController.nextPage();
                          },
                        );
                      }
                      return GestureDetector(
                        onTap: () {
                          if (item.merchant?.id != null) {
                            // Navigation logic here
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5.0),
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            child: CustomCachedImage(
                              imagePath: item.image ?? "",
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                  options: _carouselOptions(context),
                ),
                const Gap(16),
                AnimatedSmoothIndicator(
                  activeIndex: _currentIndex,
                  count: _sliderList.length,
                  effect: const ExpandingDotsEffect(
                    dotWidth: 10,
                    dotHeight: 10,
                  ),
                  onDotClicked: (index) {
                    _carouselController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 800),
                    );
                  },
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  CarouselOptions _carouselOptions(BuildContext context) {
    // Pause auto-scroll if:
    // 1. A video is currently playing
    // 2. Slider is not visible
    // 3. Current slide is a video (to give it time to load and play)
    final shouldAutoPlay =
        !_isVideoPlaying && _isSliderVisible && !_isCurrentSlideVideo();

    return CarouselOptions(
      height: context.screenWidth > 600 ? 190 : 160.0,
      autoPlay: false, // shouldAutoPlay,
      enlargeCenterPage: true,
      aspectRatio: 16 / 9,
      autoPlayCurve: Curves.fastOutSlowIn,
      enableInfiniteScroll: true,
      autoPlayAnimationDuration: const Duration(milliseconds: 800),
      viewportFraction: 0.8,
      onPageChanged: (index, reason) {
        setState(() {
          _currentIndex = index;
          log("_currentIndex: $_currentIndex");
          // Reset video playing state when page changes
          // The YoutubeSliderItem will set it back to true when it starts playing
          _isVideoPlaying = false;
        });
      },
    );
  }
}
