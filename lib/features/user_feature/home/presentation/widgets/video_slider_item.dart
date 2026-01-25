import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoSliderItem extends StatefulWidget {
  const VideoSliderItem({
    super.key,
    required this.isActive,
    required this.isVisible,
  });
  final bool isActive;
  final bool isVisible;
  @override
  State<VideoSliderItem> createState() => _VideoSliderItemState();
}

class _VideoSliderItemState extends State<VideoSliderItem> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    log("video init ");

    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      ),
    )..initialize();
  }

  @override
  void didUpdateWidget(covariant VideoSliderItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    log("video update ");
    if (_controller.value.isInitialized) {
      if (widget.isActive && widget.isVisible) {
        _controller.play();
      } else {
        _controller.pause();
      }
    } else {
      _controller =
          VideoPlayerController.networkUrl(
              Uri.parse(
                'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
              ),
            )
            ..initialize().then((_) {
              // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
              setState(() {});
              _controller.play();
            });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.red,
            ),
            child: VideoPlayer(_controller),
          )
        : const Center(child: CircularProgressIndicator());
  }
}
