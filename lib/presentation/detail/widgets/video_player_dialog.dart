/// 비디오 플레이어 다이얼로그
library video_player_dialog;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:gamerics/domain/entities/game_video.dart';
import 'package:gamerics/presentation/widgets/app_cached_network_image.dart';

/// 비디오 플레이어 다이얼로그
/// 
/// 게임 프로모션 비디오를 재생하는 다이얼로그입니다.
/// 전체화면 모드와 일반 모드를 지원합니다.
class VideoPlayerDialog extends StatefulWidget {
  const VideoPlayerDialog({
    super.key,
    required this.videos,
    required this.initialIndex,
    this.initialPosition,
    this.isFullscreen = false,
  });

  final List<GameVideo> videos;
  final int initialIndex;
  final Duration? initialPosition;
  final bool isFullscreen;

  @override
  State<VideoPlayerDialog> createState() => _VideoPlayerDialogState();
}

class _VideoPlayerDialogState extends State<VideoPlayerDialog> {
  late final PageController _pageController;
  VideoPlayerController? _videoController;
  Future<void>? _initializeFuture;
  int _currentIndex = 0;
  double _currentVolume = 1.0;
  bool _controlsVisible = true;
  Timer? _controlsHideTimer;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _currentIndex);
    if (widget.isFullscreen) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }
    _initController(_currentIndex, startPosition: widget.initialPosition);
  }

  @override
  void dispose() {
    _videoController?.dispose();
    _pageController.dispose();
    _controlsHideTimer?.cancel();
    if (widget.isFullscreen) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Stack(
      children: [
        PageView.builder(
          controller: _pageController,
          itemCount: widget.videos.length,
          onPageChanged: (index) => _initController(index),
          itemBuilder: (context, index) {
            return _buildVideoContent(context, index);
          },
        ),
        Positioned(
          top: 16,
          right: 16,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.isFullscreen)
                IconButton(
                  icon: const Icon(Icons.fullscreen_exit, color: Colors.white),
                  onPressed: _exitFullscreen,
                )
              else
                IconButton(
                  icon: const Icon(Icons.fullscreen, color: Colors.white),
                  onPressed: _openFullscreen,
                ),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  if (widget.isFullscreen) {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  } else {
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 24,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(999),
              ),
              child: DefaultTextStyle(
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 0,
                  height: 1.0,
                ),
                child: Text(
                  '${_currentIndex + 1} / ${widget.videos.length}',
                ),
              ),
            ),
          ),
        ),
      ],
    );

    if (!widget.isFullscreen) {
      content = SafeArea(child: content);
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: PopScope(
        canPop: !widget.isFullscreen,
        onPopInvokedWithResult: (didPop, _) {
          if (!didPop && widget.isFullscreen) {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          }
        },
        child: content,
      ),
    );
  }

  Widget _buildVideoContent(BuildContext context, int index) {
    final video = widget.videos[index];

    if (index != _currentIndex || _videoController == null) {
      return _buildVideoPreview(video);
    }

    return FutureBuilder<void>(
      future: _initializeFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            _videoController != null &&
            _videoController!.value.isInitialized) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: _handleVideoTap,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: AspectRatio(
                    aspectRatio: _videoController!.value.aspectRatio,
                    child: FittedBox(
                      fit: widget.isFullscreen ? BoxFit.cover : BoxFit.contain,
                      child: SizedBox(
                        width: _videoController!.value.size.width,
                        height: _videoController!.value.size.height,
                        child: VideoPlayer(_videoController!),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: IgnorePointer(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black54],
                        ),
                      ),
                    ),
                  ),
                ),
                _buildPlaybackControls(context),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return _buildVideoPreview(video);
        } else {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        }
      },
    );
  }

  Widget _buildVideoPreview(GameVideo video) {
    return Center(
      child: Stack(
        children: [
          Positioned.fill(
            child: AppCachedNetworkImage(
              imageUrl: video.previewImageUrl,
              fit: BoxFit.contain,
            ),
          ),
          const Positioned.fill(
            child: Center(
              child: Icon(
                Icons.play_circle_fill,
                size: 72,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _initController(int index, {Duration? startPosition}) async {
    if (!mounted) return;

    setState(() {
      _currentIndex = index;
    });

    final video = widget.videos[index];
    if (video.videoUrl.isEmpty) {
      _videoController?.dispose();
      _videoController = null;
      _initializeFuture = null;
      setState(() {});
      return;
    }

    final controller = VideoPlayerController.networkUrl(
      Uri.parse(video.videoUrl),
    );
    _videoController?.dispose();
    _videoController = controller;
    _initializeFuture = controller.initialize().then((_) {
      if (startPosition != null &&
          startPosition > Duration.zero &&
          startPosition < controller.value.duration) {
        controller.seekTo(startPosition);
      }
      controller
        ..setLooping(true)
        ..setVolume(_currentVolume)
        ..play();
      _showControlsTemporarily(forceShow: true);
    });
    setState(() {});
  }

  void _togglePlayPause() {
    final controller = _videoController;
    if (controller == null) return;
    if (controller.value.isPlaying) {
      controller.pause();
      _controlsHideTimer?.cancel();
      setState(() {
        _controlsVisible = true;
      });
    } else {
      controller.play();
      setState(() {
        _controlsVisible = true;
      });
      _startHideControlsTimer();
    }
  }

  Widget _buildPlaybackControls(BuildContext context) {
    final controller = _videoController;
    if (controller == null) {
      return const SizedBox.shrink();
    }

    return Positioned(
      bottom: 16,
      left: 16,
      right: 16,
      child: ValueListenableBuilder<VideoPlayerValue>(
        valueListenable: controller,
        builder: (context, value, _) {
          final duration = value.duration;
          final position = value.position;
          final shouldShowControls = _controlsVisible || !value.isPlaying;
          if (!shouldShowControls) {
            return const SizedBox.shrink();
          }

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTapDown: (_) => _showControlsTemporarily(forceShow: true),
                child: VideoProgressIndicator(
                  controller,
                  allowScrubbing: true,
                  colors: VideoProgressColors(
                    playedColor: Colors.amberAccent,
                    backgroundColor: Colors.white24,
                    bufferedColor: Colors.white54,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      value.isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _togglePlayPause();
                      _showControlsTemporarily(forceShow: true);
                    },
                  ),
                  Text(
                    '${_formatDuration(position)} / ${_formatDuration(duration)}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  const Spacer(),
                  Icon(
                    _currentVolume == 0 ? Icons.volume_off : Icons.volume_up,
                    color: Colors.white,
                  ),
                  Expanded(
                    child: Slider(
                      value: _currentVolume,
                      onChanged: (value) {
                        setState(() {
                          _currentVolume = value;
                          controller.setVolume(value);
                        });
                        _showControlsTemporarily(forceShow: true);
                      },
                      min: 0,
                      max: 1,
                      divisions: 10,
                      activeColor: Colors.white,
                      inactiveColor: Colors.white38,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    final hours = duration.inHours;

    if (hours > 0) {
      final hoursStr = hours.toString().padLeft(2, '0');
      return '$hoursStr:$minutes:$seconds';
    }

    return '$minutes:$seconds';
  }

  void _handleVideoTap() {
    _showControlsTemporarily(forceShow: true);
  }

  void _showControlsTemporarily({bool forceShow = false}) {
    _controlsHideTimer?.cancel();
    if (forceShow || !_controlsVisible) {
      if (mounted) {
        setState(() {
          _controlsVisible = true;
        });
      } else {
        _controlsVisible = true;
      }
    }
    _startHideControlsTimer();
  }

  void _startHideControlsTimer() {
    _controlsHideTimer?.cancel();
    if (!mounted) return;
    if (_videoController?.value.isPlaying ?? false) {
      _controlsHideTimer = Timer(const Duration(seconds: 3), () {
        if (!mounted) return;
        setState(() {
          _controlsVisible = false;
        });
      });
    }
  }

  Future<void> _openFullscreen() async {
    final position = _videoController?.value.position ?? Duration.zero;
    _videoController?.pause();
    final result = await Navigator.of(context).push<VideoViewerResult>(
      MaterialPageRoute(
        builder: (_) => VideoPlayerDialog(
          videos: widget.videos,
          initialIndex: _currentIndex,
          initialPosition: position,
          isFullscreen: true,
        ),
        fullscreenDialog: true,
      ),
    );

    if (!mounted) return;

    final newIndex = result?.index ?? _currentIndex;
    final newPosition = result?.position ?? position;
    _pageController.jumpToPage(newIndex);
    await _initController(newIndex, startPosition: newPosition);
  }

  void _exitFullscreen() {
    Navigator.of(context).pop(
      VideoViewerResult(
        index: _currentIndex,
        position: _videoController?.value.position ?? Duration.zero,
      ),
    );
  }
}

/// 비디오 뷰어 결과
/// 
/// 전체화면 모드에서 일반 모드로 돌아올 때 전달되는 결과입니다.
class VideoViewerResult {
  const VideoViewerResult({required this.index, required this.position});

  final int index;
  final Duration position;
}

