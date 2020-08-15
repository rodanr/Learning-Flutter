import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import '../components/bottom_button.dart';
import '../screens/result_page.dart';
import '../components/app_brain.dart';

int _heightInCm = 180;
int _weightInKg = 60;
int _age = 25;

enum _GenderType { male, female }

_GenderType _selectedGender;

class InputPage extends StatefulWidget {
  int getHeightInCm() {
    return _heightInCm;
  }

  int weightInKg() {
    return _weightInKg;
  }

  int getAge() {
    return _age;
  }

  String getGender() {
    if (_selectedGender == _GenderType.male) {
      return 'male';
    } else {
      return 'female';
    }
  }

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        //Column widget replaced by ListView to overcome flex render overflow
        //error by some pixels
        body: ListView(
          children: <Widget>[
            //Male card
            Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: _selectedGender == _GenderType.male
                        ? activeCardColor
                        : inActiveCardColor,
                    cardChild: IconContent(
                      label: 'MALE',
                      icon: FontAwesomeIcons.mars,
                    ),
                    onPress: () {
                      setState(() {
                        _selectedGender = _GenderType.male;
                      });
                    },
                  ),
                ),
                //Female Card
                Expanded(
                  child: ReusableCard(
                    colour: _selectedGender == _GenderType.female
                        ? activeCardColor
                        : inActiveCardColor,
                    cardChild: IconContent(
                      label: 'FEMALE',
                      icon: FontAwesomeIcons.venus,
                    ),
                    onPress: () {
                      setState(() {
                        _selectedGender = _GenderType.female;
                      });
                    },
                  ),
                ),
              ],
            ),
            ReusableCard(
              colour: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        _heightInCm.toString(),
                        style: numberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: labelTextStyle,
                      )
                    ],
                  ),
                  //This slider theme can be moved to the theme data section of the parent widget that is material app widget
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xff8d8e98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xffeb1555),
                      overlayColor: Color(0x30eb1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 10.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 25.0),
                    ),
                    child: Slider(
                      value: _heightInCm.toDouble(),
                      min: 120.0,
                      max: 280,
                      onChanged: (double newValue) {
                        setState(() {
                          _heightInCm = newValue.round().toInt();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColor,
                    cardChild: Column(
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: labelTextStyle,
                        ),
                        Text(
                          _weightInKg.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              iconData: FontAwesomeIcons.minus,
                              functionToPerform: () {
                                setState(() {
                                  _weightInKg--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              iconData: FontAwesomeIcons.plus,
                              functionToPerform: () {
                                setState(() {
                                  _weightInKg++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColor,
                    cardChild: Column(
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: labelTextStyle,
                        ),
                        Text(
                          _age.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              iconData: FontAwesomeIcons.minus,
                              functionToPerform: () {
                                setState(() {
                                  _age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              iconData: FontAwesomeIcons.plus,
                              functionToPerform: () {
                                setState(() {
                                  _age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            BottomButton(
              buttonText: 'CALCULATE',
              onPress: () {
                AppBrain appBrain = AppBrain();
                appBrain.getBmiIndex();
                appBrain.getLevelStage();
                appBrain.getRemarks();
                appBrain.getLevelStageColor();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultPage();
                    },
                  ),
                );
              },
            ),
          ],
        ),);
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData iconData;
  final Function functionToPerform;
  RoundIconButton({this.iconData, this.functionToPerform});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: functionToPerform,
      child: Icon(
        iconData,
        color: Colors.white,
      ),
      fillColor: Color(0xff4c4f5e),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        height: 56,
        width: 56,
      ),
    );
  }
}
