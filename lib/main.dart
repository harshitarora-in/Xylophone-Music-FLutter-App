import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() => runApp(Xylophone());

class Xylophone extends StatelessWidget {
  const Xylophone({Key? key}) : super(key: key);
  static final player = AudioPlayer();
  void playSound(int noteNumber) {
    player.setAsset('music/assets_note$noteNumber.wav');
    player.play();
  }

  Expanded buildKey(int noteNumber, Color demo) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(demo),
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.zero))),
        child: Text(''),
        onPressed: () {
          playSound(noteNumber);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            buildKey(1, Colors.red),
            buildKey(2, Colors.blue),
            buildKey(3, Colors.green),
            buildKey(4, Colors.yellow),
            buildKey(5, Colors.orange),
            buildKey(6, Colors.deepPurple),
            buildKey(7, Colors.teal),
          ]),
        ),
      ),
    );
  }
}
