import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioRep extends StatefulWidget {
  @override
  _AudioRepState createState() => _AudioRepState();
}

class _AudioRepState extends State<AudioRep> {

  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  bool isMuted = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Multimedia - Audio"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              audioPlayer.stop();
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: GestureDetector(
            onTap: () async {
              if (audioPlayer.state == PlayerState.playing) {
                audioPlayer.pause();
              } else if (audioPlayer.state == PlayerState.paused) {
                audioPlayer.resume();
              } else {
                await audioPlayer.play(AssetSource('audio.mp3'));
              }
              setState(() {
                isPlaying = !isPlaying;
              });
            },
            child: Image.network('https://i.pinimg.com/564x/7d/54/3d/7d543da2ba6f2130d8b37ffb2ca8b291.jpg')
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                onPressed: () async {
                  if (audioPlayer.state == PlayerState.playing) {
                    audioPlayer.pause();
                  } else if (audioPlayer.state == PlayerState.paused) {
                    audioPlayer.resume();
                  } else {
                    await audioPlayer.play(AssetSource('audio.mp3'));
                  }
                  setState(() {
                    isPlaying = !isPlaying;
                  });
                },
              ),
              IconButton(
                icon: Icon(isMuted ? Icons.volume_off : Icons.volume_up),
                onPressed: () {
                  setState(() {
                    isMuted = !isMuted;
                  });
                  if (isMuted) {
                    audioPlayer.setVolume(0);
                  } else {
                    audioPlayer.setVolume(1);
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.stop),
                onPressed: () {
                  audioPlayer.stop();
                  setState(() {
                    isPlaying = false;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}