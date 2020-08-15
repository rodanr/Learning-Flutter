//Question class to enable us to use the object that holds the two structure which is question and answer
class Question {
  //underscore is used to make variables private in dart language
  //This two variable declared at line 5 and 6 are accessible inside this class only
  String _questionText;
  bool _questionAnswer;
  //Questions are in string where answers are in true or false so boolean type can be used
  //Constructor with two parameters:questions and answers
  //constructor for setting the question and answer variable of the objects
  Question(String questionText, bool questionAnswer) {
    //this.questionText and this.questionAnswer refers to the variables of the object
    //where questionText and questionAnswer parameters of the constructor refers to the parametric variable and
    //doesn't effect or relate to the class variables
    this._questionText = questionText;
    this._questionAnswer = questionAnswer;
  }

  //Encapsulation by setting the getters so data of variable cannot be modified
  String getQuestionText() {
    return _questionText;
  }

  bool getQuestionAnswer() {
    return _questionAnswer;
  }
}
