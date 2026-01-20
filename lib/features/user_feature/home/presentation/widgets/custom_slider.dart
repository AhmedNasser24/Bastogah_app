import 'package:bastogah_app/core/enums/request_state_enum.dart';
import 'package:bastogah_app/core/extenstion/media_query_extension.dart';
import 'package:bastogah_app/core/theme/app_images.dart';
import 'package:bastogah_app/features/user_feature/home/presentation/manager/home_cubit/user_home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../../core/widgets/custom_cached_image.dart';
import '../../../../../core/widgets/custom_skeletonizer.dart';
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
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserHomeCubit, UserHomeState>(
      listener: (context, state) {
        // if (state is SlidersFailure) {
        //   CustomFlutterToast.showErrorToast(state.errMessage);
        // }
      },
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
                options: carouselOptions(context),
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
        } else if (state.sliderRequestState == RequestStateEnum.success) {
          return VisibilityDetector(
            key: const Key('home_slider'),
            onVisibilityChanged: (info) {
              final visible = info.visibleFraction > 0.3;

              if (_isSliderVisible != visible) {
                setState(() {
                  _isSliderVisible = visible;
                  if (!visible) {
                    _isVideoPlaying = false;
                  }
                });
              }
            },
            child: Column(
              children: [
                CarouselSlider(
                  carouselController: _carouselController,
                  items: state.sliderList.asMap().entries.map((entry) {
                    final index = entry.key;
                    final item = entry.value;

                    if (item.videoLink != null && item.videoLink!.isNotEmpty) {
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
                          // context.push(
                          //   RouteName.userProductDetails,
                          //   extra: UserMerchantModel(
                          //     id: item.merchant?.id,
                          //     displayName: item.merchant?.displayName,
                          //     image: item.merchant?.image,
                          //   ),
                          // );
                        }
                        // context.push(RouteName.userMerchants);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          // child: Image.asset(item, fit: BoxFit.cover),
                          child: CustomCachedImage(imagePath: item.image ?? ""),
                        ),
                      ),
                    );
                  }).toList(),
                  options: carouselOptions(context),
                ),
                const Gap(16),
                AnimatedSmoothIndicator(
                  activeIndex: _currentIndex,
                  count: state.sliderList.length,
                  effect: const ExpandingDotsEffect(
                    dotWidth: 10,
                    dotHeight: 10,
                  ), // You can customize this further
                  onDotClicked: (index) {
                    setState(() {
                      _currentIndex = index;
                      // _isVideoPlaying = false;
                    });
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

  CarouselOptions carouselOptions(BuildContext context) {
    return CarouselOptions(
      height: context.screenWidth > 600
          ? 190
          : 160.0, // Removed to use aspect ratio

      autoPlay: !_isVideoPlaying && _isSliderVisible,
      enlargeCenterPage: true,
      aspectRatio: 16 / 9,
      autoPlayCurve: Curves.fastOutSlowIn,
      enableInfiniteScroll: true,
      autoPlayAnimationDuration: const Duration(milliseconds: 800),
      viewportFraction: 0.8,
      onPageChanged: (index, reason) {
        setState(() {
          _currentIndex = index;

          // _isVideoPlaying = false;

          // if (reason == CarouselPageChangedReason.manual) {
          //   _isVideoPlaying = false;
          // }
        });
      },
    );
  }
}
