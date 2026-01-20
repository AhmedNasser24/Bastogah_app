import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeSliderItem extends StatefulWidget {
  final String videoUrl;
  final bool isActive;
  final bool isSliderVisible;
  final ValueChanged<bool> onVideoPlayStateChanged;
  final VoidCallback? onVideoFinished;

  const YoutubeSliderItem({
    super.key,
    required this.videoUrl,
    required this.isActive,
    required this.isSliderVisible,
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
        autoPlay: false,
        mute: true,
        disableDragSeek: true,
        hideControls: true,
        hideThumbnail: false,
        enableCaption: false,
        forceHD: false,
        showLiveFullscreenButton: false,
        isLive: false,
        loop: false,
        controlsVisibleAtStart: false,
      ),
    )..addListener(_listener);
  }

  void _listener() {
    if (!_isPlayerReady || !mounted) return;
    // if (!mounted) return;

    widget.onVideoPlayStateChanged(_controller.value.isPlaying);
  }

  @override
  void didUpdateWidget(covariant YoutubeSliderItem oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.isActive != widget.isActive ||
        oldWidget.isSliderVisible != widget.isSliderVisible) {
      // if (_isPlayerReady) {
      if (widget.isActive &&
          widget.isSliderVisible &&
          !_controller.value.isPlaying) {
        _controller.play();
        return;
      }
      // }
      if (widget.isActive &&
          !widget.isSliderVisible &&
          _controller.value.isPlaying) {
        _controller.pause();
      } else if (!widget.isActive && _controller.value.isPlaying) {
        _controller.seekTo(Duration.zero);
        _controller.pause();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: IgnorePointer(
        ignoring: true,
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: false,
          onReady: () => _isPlayerReady = true,

          onEnded: (_) {
            widget.onVideoPlayStateChanged(false);
            widget.onVideoFinished?.call();
          },
        ),
      ),
    );
  }
}
