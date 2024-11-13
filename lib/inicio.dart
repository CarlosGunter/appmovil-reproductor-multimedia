import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  @override
  InicioState createState() => InicioState();
}

class InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Multimedia"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Selecciona un reproductor"),
              const SizedBox(height: 10,),
              ElevatedButton(
                child: const Text('Audio'),
                onPressed: () {
                  Navigator.pushNamed(context, 'audio');
                },
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                child: const Text('Video'),
                onPressed: () {
                  Navigator.pushNamed(context, 'video');
                },
              ),
            ]
          ),
        )
      ),
    );
  }
}