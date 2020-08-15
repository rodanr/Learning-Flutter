import 'question.dart';

class QuizEngine {
  //Declaring a counting variable to manipulate the list object by incrementing the object no.
  //contd. so that the question changes
  int questionNumber = 0;

  //List of all the questions with their respective answers
  List<Question> questionBank = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true)
  ]; //questionBank
//getters to get the Question and Answer
  String getQuestion() {
    return questionBank[questionNumber].getQuestionText();
  } //getQuestion

  bool getAnswer() {
    return questionBank[questionNumber].getQuestionAnswer();
  } //getAnswer

  void nextQuestion() {
    //Question changes till the question list finishes thanks to IF statement
    //Since list starts from 0 and length are counted from 1 so -1 is done here
    if (questionNumber < questionBank.length - 1) {
      questionNumber++;
    }
  } //nextQuestion

  //Checks if present question is the last question
  bool isThisLastQuestion() {
    if (questionNumber == (questionBank.length - 1)) {
      return true;
    } else {
      return false;
    }
  } //isThisLastQuestion

  //Resets the questionNumber and starts the question from first
  void reset() {
    questionNumber = 0;
  } //reset
}
