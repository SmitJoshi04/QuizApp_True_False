import 'package:flutter/cupertino.dart';
import 'question.dart';

class QuizBrain{
  int _questionNumber = 0;
  final List<Question> _questionBank = [
    Question(q: 'Naruto is a skilled user of the Sharingan.', a: false),
    Question(q: 'The Nine-Tails fox spirit is sealed within Naruto.', a: true),
    Question(q: 'Sasuke Uchiha is Naruto\'s best friend and rival.', a: true),
    Question(q: 'Naruto possesses the ability to perform powerful ninja techniques called Jutsu.', a: true),
    Question(q: 'The Akatsuki is a villainous organization in the Naruto series.', a: true),
    Question(q: 'Naruto father name is Minato Namikaze.', a: true),
    Question(q: 'Sakura Haruno is a member of Team 7, along with Naruto and Sasuke.', a: true),
    Question(q: 'Naruto becomes the Hokage of the Hidden Leaf Village in the end.', a: true),
    Question(q: 'The Nine-Tails fox spirit inside Naruto\'s body is called Kurama.', a: true),
    Question(q: 'Naruto signature catchphrase is Im gonna be the King of Pirates!', a: false),
  ];
  void nextQuestion(){
    if(_questionNumber < _questionBank.length ){
      _questionNumber++;
    }
  }
  String getQuestionText(){
    return _questionBank[_questionNumber].questionText;
  }
  bool getQuestionAnswer(){
    return _questionBank[_questionNumber].questionAnswer;
  }
  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {

      debugPrint('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}


