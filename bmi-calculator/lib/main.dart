import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //copyWith overrides some themeData Property with our custom settings as described inside the parenthesis of copywith()
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        //I haven't used the floatingActionButton but also I am custom themed it just for practice
        //We can use accent color to change floatingActionButtonTheme but it is depreciated now and we use as following as shown below with more modifications allowed
//          floatingActionButtonTheme: FloatingActionButtonThemeData(
//            //The color of child of the button changes For Eg: if we can + Icon as child the + icon color changes with this foregroundColor property
//            foregroundColor: Colors.green,
//            //The color of the button changes excluding the child color using backgroundColor property
//            backgroundColor: Colors.blue.shade900,
//          ),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      //InputPage() is not a method its a complete class so no need for creating object for the InputPage class (Note:Wrote this cuz I had doubt in this before a while
      home: InputPage(),
    );
  }
}
