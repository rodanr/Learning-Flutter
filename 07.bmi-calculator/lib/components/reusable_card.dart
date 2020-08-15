import 'package:flutter/material.dart';

//mutable means changeable and immutable means unchangeable
//StatelessWidget contains immutable properties
class ReusableCard extends StatelessWidget {
  //Once colour is set cannot be changed but every object can have their own unique color and after setting it then it cannot be changed
  //final makes the variable immutable where StatelessWidget can only have immutable instances
  final Color colour;

  final Widget cardChild;

  final Function onPress;

  //Curly braces allows to use the parameter name while the method is being called with arguments
  //this.colour refers to the objects's variable of data type Color and the argument passed to the constructor gets directly passed to the object's colour variable
  ReusableCard({@required this.colour, @required this.cardChild, this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTap the onPress function gets executed like as statement where onPress function is get as an argument
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
