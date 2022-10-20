import 'package:flutter/material.dart';
import 'screens/music_player_screen.dart';
import 'package:wear/wear.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WatchScreen(),
    );
  }
}

class WatchScreen extends StatelessWidget {
  const WatchScreen({super.key});

  @override
  Widget build(BuildContext context) => WatchShape(
        builder: (context, shape, child) => InheritedShape(
          shape: shape,
          child: AmbientMode(
            builder: (context, mode, child) => mode == WearMode.active
                ? const MusicPlayerScreen()
                : const AmbientWatchFace(),
          ),
        ),
      );
}

class AmbientWatchFace extends StatelessWidget {
  const AmbientWatchFace({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'FlutterOS',
                style: TextStyle(color: Colors.blue[600], fontSize: 30),
              ),
              const SizedBox(height: 15),
              const FlutterLogo(size: 60.0),
            ],
          ),
        ),
      );
}
