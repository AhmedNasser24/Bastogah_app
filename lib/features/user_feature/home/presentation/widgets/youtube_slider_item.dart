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
  bool _wasActive = false;
  bool _hasEnded = false; // Track if video finished playing

  @override
  void initState() {
    super.initState();
    _wasActive = widget.isActive;
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
    widget.onVideoPlayStateChanged(_controller.value.isPlaying);
  }

  void _handleActiveChange() {
    if (!_isPlayerReady) return;

    // If becoming inactive, pause, reset to beginning, and reset _hasEnded
    if (!widget.isActive && _wasActive) {
      _controller.pause();
      _controller.seekTo(Duration.zero);
      _hasEnded = false; // Reset so it can play again when coming back
      _wasActive = widget.isActive;
      return;
    }

    // If active and visible and video hasn't ended, play
    final shouldPlay = widget.isActive && widget.isSliderVisible && !_hasEnded;

    if (shouldPlay && !_controller.value.isPlaying) {
      _controller.play();
    } else if (widget.isActive &&
        !widget.isSliderVisible &&
        _controller.value.isPlaying) {
      // Active but slider not visible -> pause (will resume when visible again)
      _controller.pause();
    } else {
      _controller.pause();
      _controller.seekTo(Duration.zero);
    }

    _wasActive = widget.isActive;
  }

  @override
  void didUpdateWidget(covariant YoutubeSliderItem oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.isActive != widget.isActive ||
        oldWidget.isSliderVisible != widget.isSliderVisible) {
      _handleActiveChange();
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
          onReady: () {
            _isPlayerReady = true;
            // If already active when player becomes ready, start playing
            if (widget.isActive && widget.isSliderVisible && !_hasEnded) {
              _controller.play();
            }
          },
          onEnded: (_) {
            _hasEnded = true; // Mark as ended so it won't restart
            _controller.pause(); // Ensure it's paused
            widget.onVideoPlayStateChanged(false);
            widget.onVideoFinished?.call();
          },
        ),
      ),
    );
  }
}
