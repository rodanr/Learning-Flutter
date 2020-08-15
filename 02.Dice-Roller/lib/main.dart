import 'package:flutter/material.dart';
//Importing dart math library to use the Random function for rolling the dice
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[700],
        appBar: AppBar(
          title: Text('Dice Roller'),
          backgroundColor: Colors.blueGrey[700],
        ),
        body: DicePage(),
      ),
    ),
  );
}

//Using StatefulWidget because the variables for dice numbers and dice images should be changed while the app is running
class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  //Creating and initializing the integer variables to set the dice numbers for images name manipulation while rolling
  int leftDiceNumber = 6;
  int rightDiceNumber = 1;
  //This function generated random values between 1 to 6 to the variables for dice numbers initialized above
  void rollTheDices() {
    //Anything that varies or should change during program runtime should be inside the setState method of StatefulWidget class
    //The setState method also searches for the other codes and updates them that can be effected by the code inside the setState method
    //contd. For example whenever the leftDiceNumber and rightDiceNumber value changes then it starts to find the codes that are using this variables
    //contd. and set their state by updating them as the line no. 52 and 60 gets updated every time when leftDiceNumber and rightDiceNumber are updated
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

//Hot reload only updates the changes in the code inside the build section which is from line no. 43 to 67
  @override
  Widget build(BuildContext context) {
    //Using Center class to center the two dice images in center vertical inside the screen
    //Center class center align the row in vertical line
    //Center class center align the column in horizontal line
    return Center(
      //generating row to draw two dice images side by side in horizontal
      child: Row(
        children: <Widget>[
          //Expanded class: A widget that expands a child of a Row, Column, or Flex so that the child fills the available space
          //contd. if multiple children are expanded, the available space is divided among them according to the flex factor.
          Expanded(
            //FlatButton make image to behave as button
            child: FlatButton(
              onPressed: () {
                rollTheDices();
              },
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                rollTheDices();
              },
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}
