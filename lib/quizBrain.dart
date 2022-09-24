import 'package:quiz_app/question.dart';

class QuizBrain {
  int _currentQuestion = 0;
  final List<Question> _questionBank = [
    Question('My Name is Zohaib Ahmed', true),
    Question('Osama is a wonderful person', false),
    Question('Moiz is the nicest person in the world', true),
    Question('I have a Potato friend named Osama', true),
  ];

  void checkNumber() {
    if (_currentQuestion < _questionBank.length - 1) {
      _currentQuestion++;
    }
  }

  bool isFinished() {
    if (_currentQuestion >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _currentQuestion = 0;
  }

  String getQuizQuestion() => _questionBank[_currentQuestion].question;

  bool getQuizAnswer() => _questionBank[_currentQuestion].answer;
}
