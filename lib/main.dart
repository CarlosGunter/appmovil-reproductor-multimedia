import 'package:flutter/material.dart';
import 'inicio.dart';
import 'video.dart';
import 'audio.dart';

void main() => runApp(Main());

class Main extends StatefulWidget {
  @override
  Estado createState() => Estado();
}

class Estado extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      routes: {
        'inicio': (context) => Inicio(),
        'audio': (context) => AudioRep(),
        'video': (context) => VideoRep(),
      },
      initialRoute: 'inicio',
    );
  }
}

