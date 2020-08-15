import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String changedText;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextField(
              onChanged: (newValue) => changedText = newValue,
            ),
            FlatButton(
                onPressed: () {
                  context.read<MyData>().updateText(changedText);
                },
                child: Text("Submit")),
            Text(context.watch<MyData>().textTyped),
          ],
        ),
      ),
    );
  }
}
