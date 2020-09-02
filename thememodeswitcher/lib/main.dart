import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool darkModeFlag = false;
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void getDarkModeStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      var result = prefs.getBool('darkModeStatus');
      if (result != null){
        darkModeFlag = result;
      }
      else{
        darkModeFlag =  false;
      }
    });
  }

  void setThemeStatus(bool newStatus) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkModeStatus', newStatus);
    setState(() {
      var result = prefs.getBool('darkModeStatus');
      if (result != null){
        darkModeFlag = result;
      }
      else{
        darkModeFlag =  false;
      }
    });
  }

  @override
  void initState() {
    getDarkModeStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkModeFlag ? ThemeData.dark() : ThemeData.light(),
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Dark mode"),
                Switch(
                  // switch is set true if darkModeFlag is true
                  value: darkModeFlag,
                  onChanged: setThemeStatus,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
