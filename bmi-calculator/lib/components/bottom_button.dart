import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final Function onPress;
  final String buttonText;
  BottomButton({this.buttonText, this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Text(
          buttonText,
          style: bottomTextStyle,
          textAlign: TextAlign.center,
        ),
        color: bottomContainerColor,
        height: bottomContainerHeight,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10.0),
      ),
    );
  }
}
