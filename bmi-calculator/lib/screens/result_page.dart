import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/bottom_button.dart';
import '../components/app_brain.dart';

class ResultPage extends StatelessWidget {
  final AppBrain appBrain = AppBrain();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21)),
      home: Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Text(
                'Your Results',
                style: resultTextStyle,
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.all(15.0),
                color: Color(0xff221F30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      appBrain.getLevelStage(),
                      style: TextStyle(
                        color: appBrain.getLevelStageColor(),
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      appBrain.getBmiIndex().toStringAsFixed(1),
                      style: TextStyle(
                        color: appBrain.getLevelStageColor(),
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      appBrain.getRemarks(),
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              buttonText: 'RECALCULATE',
              onPress: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
