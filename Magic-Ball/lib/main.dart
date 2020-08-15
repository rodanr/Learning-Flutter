import 'package:flutter/material.dart';
import 'dart:math';

//If any of the code below are confusing then refer to Dice Roller app which I previously made which is pretty
//contd. similar to this one
void main() {
  runApp(BallPage());
}

class BallPage extends StatefulWidget {
  @override
  _BallPageState createState() => _BallPageState();
}

class _BallPageState extends State<BallPage> {
  //Initializing the ballNumber
  int ballNumber = 0;
  void rollTheMagic() {
    setState(() {
      ballNumber = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text('Magic Ball'),
        ),
        body: Center(
          //Here Iam not using Expanded class like before as Expanded class are made to work with Row and Column
          //contd.  with multiple children
          child: FlatButton(
            onPressed: () {
              rollTheMagic();
            },
            child: Image.asset('images/ball$ballNumber.png'),
          ),
        ),
      ),
    );
  }
}
