import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoRep extends StatefulWidget {

  @override
  _VideoRepState createState() => _VideoRepState();
}

class _VideoRepState extends State<VideoRep> {

  late VideoPlayerController videoController;
  var videoPosition = 0;
  var videoDuration = 0;
  bool isPlaying = false;
  bool isMuted = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoController = VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');
    videoController.initialize().then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(appBar: AppBar(
        title: const Text("Multimedia - Audiovisual"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
        body:
        videoController.value.isInitialized
            ? Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 250,
                alignment: Alignment.center,
                child: VideoPlayer(videoController)
              ),
            )
            : const Center(child: CircularProgressIndicator()),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                onPressed: () {
                  if (videoController.value.isPlaying) {
                    videoController.pause();
                  } else {
                    videoController.play();
                  }
                  setState(() {
                    isPlaying = videoController.value.isPlaying;
                  });
                },
              ),
              IconButton(
                icon: Icon(isMuted ? Icons.volume_off : Icons.volume_up),
                onPressed: () {
                  if (isMuted) {
                    videoController.setVolume(1);
                    setState(() {
                      isMuted = false;
                    });
                  } else {
                    videoController.setVolume(0);
                    setState(() {
                      isMuted = true;
                    });
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.replay),
                onPressed: () {
                  videoController.seekTo(Duration.zero);
                },
              ),
              Expanded(
                child: VideoProgressIndicator(
                  videoController,
                  allowScrubbing: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
