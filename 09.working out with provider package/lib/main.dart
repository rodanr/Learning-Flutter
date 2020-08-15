import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/data.dart';
import 'package:todo/home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => MyData(),
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
