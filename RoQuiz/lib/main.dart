import 'package:flutter/material.dart';
import 'quiz_engine.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(QuizApp());
}

//Stateful widget added inside the stateless widget inorder to use the benefit of hot reload i.e QuizPage()
class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //SafeArea to not let the widgets overflow from the screen
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade900,
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  //Creating object of the QuizEngine class
  QuizEngine quizEngine = QuizEngine();
  //Declaring and Initializing the variables to count the right and wrong answers
  int rightAnswers = 0;
  int wrongAnswers = 0;

  //List to generate the tick and wrong signs icons dynamically
  List<Icon> scoreBoard = [];

  void resetAnswerCounters() {
    rightAnswers = 0;
    wrongAnswers = 0;
  }

  _quizCompleteDialog(context) {
    //Popups when the quiz questions are completed
    Alert(
            context: context,
            title: "Your Score:",
            desc:
                "Correct Answers: $rightAnswers\nWrong Answers: $wrongAnswers")
        .show();
    //Resetting the questionNumber from QuizEngine
    quizEngine.reset();
    //Clears or empties the scoreBoard Icon list
    scoreBoard.clear();
    resetAnswerCounters();
  }

  //Function to draw the tick and wrong sign below the app screen
  void drawScoreBoard(String signToDraw) {
    if (signToDraw == 'tick') {
      //Adds tick icon to the scoreBoard List
      scoreBoard.add(Icon(
        Icons.check,
        color: Colors.green,
      ));
    } else {
      //Adds cross icon to the scoreBoard List
      scoreBoard.add(Icon(
        Icons.close,
        color: Colors.red,
      ));
    }
  } //drawScoreBoard

  //Function to check answer inside the class
  void checkAnswer(bool userAnswer) {
    //If I keep the _quizCompleteDialog here then extra rightAnswers or wrongAnswers will be incremented and also extra icon will be drawn
    //contd. in the ScoreBoard.
    //setState to change the widgets property when anything in the code changes inside this setState method.
    setState(() {
      if (userAnswer == quizEngine.getAnswer()) {
        //incrementing the rightAnswers counters
        rightAnswers++;
        drawScoreBoard('tick');
        //After drawing the ScoreBoard and incrementing the answer counters for last question
        //contd. _quizCompleteDialog(context) executes
        //quizEngine.isThisLastQuestion() returns true boolean value if present question is the last question
        if (quizEngine.isThisLastQuestion()) {
          _quizCompleteDialog(context);
        } else {
          quizEngine.nextQuestion();
        }
      } else {
        wrongAnswers++;
        drawScoreBoard('cross');
        if (quizEngine.isThisLastQuestion()) {
          _quizCompleteDialog(context);
        } else {
          quizEngine.nextQuestion();
        }
      }
    });
  } //checkAnswer

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          // (5/7) part of column for question space
          // Total part is 5(of question)+1(of true button)+1(of False Button) = 7
          //By default the value of flex is 1
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            //Centering the question inside this column having area of flex: 5
            child: Center(
              child: Text(
                quizEngine.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.green,
              //Color doesn't show up until the onPressed Method is implemented
              child: Text(
                'True',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              //When True Button is Pressed
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              //When False Button is Pressed
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreBoard,
        )
      ],
    );
  }
}
