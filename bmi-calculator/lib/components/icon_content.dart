import 'package:flutter/material.dart';

const TextStyle labelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xff8d8e98),
);

class IconContent extends StatelessWidget {
  final label;
  final textColor;
  final IconData icon;
  IconContent(
      {@required this.label, @required this.textColor, @required this.icon});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(label, style: labelTextStyle)
      ],
    );
  }
}
