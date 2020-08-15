import 'package:flutter/material.dart';
//I imported this package by reading documentation from flutter packages docs
//website I visited pub.dev
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(Xylophone());
}

class Xylophone extends StatefulWidget {
  @override
  _XylophoneState createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  //Initializing the player as explained in documentation
  final player = AudioCache();
//Function to play the note with noteNumber as parameter to receive
  void playTheNote(int noteNumber) {
    player.play('note$noteNumber.wav');
  }

//Returns the Whole Combined Widget every time when the function is called with parameters as Color object and integer
//contd. for noteNumber
  Expanded buildKey(Color colorName, int noteNumber) {
    return Expanded(
      child: FlatButton(
        color: colorName,
        //SetState is not necessary as the audio play is in background
        //Playing the note doesn't draw anything on the screen so no need for SetState method
        //Even if you call SetState method the app runs same
        onPressed: () {
          playTheNote(noteNumber);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //Calling the buildKey function to make the columns of the respective colors and to
              //contd. play the respective note
              //Since the whole combined widget is returned where Expanded class as the main parent
              //contd. the widget gets drawn to the screen every time the widget is returned here
              buildKey(Colors.red, 1),
              buildKey(Colors.orange, 2),
              buildKey(Colors.yellow, 3),
              buildKey(Colors.green, 4),
              buildKey(Colors.teal, 5),
              buildKey(Colors.blue, 6),
              buildKey(Colors.purple, 7),
            ],
          ),
        ),
      ),
    );
  }
}
