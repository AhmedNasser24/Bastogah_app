import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeSliderItem extends StatefulWidget {
  final String videoUrl;
  final ValueChanged<bool> onVideoPlayStateChanged;
  final VoidCallback? onVideoFinished;

  const YoutubeSliderItem({
    super.key,
    required this.videoUrl,
    required this.onVideoPlayStateChanged,
    this.onVideoFinished,
  });

  @override
  State<YoutubeSliderItem> createState() => _YoutubeSliderItemState();
}

class _YoutubeSliderItemState extends State<YoutubeSliderItem> {
  late YoutubePlayerController _controller;
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);
    _controller = YoutubePlayerController(
      initialVideoId: videoId ?? '',

      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true, // Start muted for auto-play best practices
        disableDragSeek: true,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: false,
        hideThumbnail: true,
        hideControls: true,
        showLiveFullscreenButton: false,
      ),
    )..addListener(_listener);
  }

  void _listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      if (_controller.value.isPlaying) {
        widget.onVideoPlayStateChanged(true);
      } else {
        widget.onVideoPlayStateChanged(false);
      }
    }
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.videoUrl),

      onVisibilityChanged: (visibilityInfo) {
        if (!_isPlayerReady) return;

        var visiblePercentage = visibilityInfo.visibleFraction;
        if (visiblePercentage > 0.8) {
          if (!_controller.value.isPlaying) {
            _controller.play();
          }
        } else {
          if (_controller.value.isPlaying) {
            _controller.pause();
          }
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: IgnorePointer(
          ignoring: true,

          child: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: false,
            onReady: () {
              _isPlayerReady = true;
            },
            onEnded: (data) {
              widget.onVideoPlayStateChanged(false);
              widget.onVideoFinished?.call();
            },
          ),
        ),
      ),
    );
  }
}
