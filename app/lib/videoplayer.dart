import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Videoplayer extends StatefulWidget {
  String videoUrl;

  Videoplayer(this.videoUrl);

  @override
  State<StatefulWidget> createState() {
    return VideoplayerState(videoUrl);
  }
}

class VideoplayerState extends State<Videoplayer> {
  String videoUrl;

  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  bool startedPlaying = false;

  bool open = true;

  VideoplayerState(this.videoUrl);

  @override
  void initState() {
    // Create an store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    initStateInner();

    super.initState();
  }

  void initStateInner() {
    _controller = VideoPlayerController.network(
      videoUrl,
    );

    _controller.initialize();
    _controller.play();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  Future<bool> started() async {
    await _controller.play();
    startedPlaying = true;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: started(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the VideoPlayerController has finished initialization, use
          // the data it provides to limit the aspect ratio of the video.
          return AnimatedBuilder(
              animation: _controller,
              child: VideoProgressIndicator(
                  _controller,
                  allowScrubbing: true),
              builder: (context, child) {
                return AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    // Use the VideoPlayer widget to display the video.
                    child: GestureDetector(
                      onTap: () async {
                        await _controller.seekTo(Duration.zero);
                        setState(() {
                          _controller.play();
                        });
                      },
                      child: VideoPlayer(_controller),
                    )
                );
              }
          );
        } else {
          // If the VideoPlayerController is still initializing, show a
          // loading spinner.
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  void didUpdateWidget(Videoplayer oldWidget) {
    if (videoUrl != widget.videoUrl) {
      setState(() {
        videoUrl = widget.videoUrl;
        initStateInner();
      });
    }
    super.didUpdateWidget(oldWidget);
  }
}
