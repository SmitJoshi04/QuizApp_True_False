import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: const Center(
            child: Text('Quizzler'),
          ),
        ),
        body: const SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: QuizePage(),
          ),
        ),
      ),
    );
  }
}

class QuizePage extends StatefulWidget {
  const QuizePage({Key? key}) : super(key: key);

  @override
  State<QuizePage> createState() => _QuizePageState();
}

class _QuizePageState extends State<QuizePage> {
  List<Icon> scoreKeeper = [];
  int totalCorrectAnswers = 0;
  //List questions =['Naruto is a skilled user of the Sharingan.','The Nine-Tails fox spirit is sealed within Naruto','Sasuke Uchiha is Naruto\'s best friend and rival.','Naruto possesses the ability to perform powerful ninja techniques called Jutsu.','The Akatsuki is a villainous organization in the Naruto series.','Naruto father name is Minato Namikaze.',' Sakura Haruno is a member of Team 7, along with Naruto and Sasuke.','Naruto becomes the Hokage of the Hidden Leaf Village in the end.','The Nine-Tails fox spirit inside Naruto\'s body is called Kurama.','Naruto signature catchphrase is Im gonna be the King of Pirates!'];
 // List ans=['False','True','True','True','True','True','True','True','True','False'];
  //var questionNumber = 0;

  void checkAnswer(bool userAnswer){
    bool correctAnswer = quizBrain.getQuestionAnswer();
    setState(() {
      if(quizBrain.isFinished() == true){
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.\nTotal Correct Answers: $totalCorrectAnswers',
        ).show();

        quizBrain.reset();
        scoreKeeper = [];
        totalCorrectAnswers = 0;
      }
    if(userAnswer == correctAnswer) {
      totalCorrectAnswers++;
      scoreKeeper.add(
        const Icon(Icons.check,color: Colors.white,)
      );
    }
    else{
      scoreKeeper.add(
          const Icon(Icons.close,color: Colors.white,)
      );
    }

      quizBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
         Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  style: const TextStyle(
                    fontSize: 25.0,
                  ),
                ),
            ),
          ),
        ),
        Expanded(child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.red),
            ),
            onPressed: () {
              checkAnswer(true);
            },
            child: const Text('True',
            style: TextStyle(
              color: Colors.white,
            ),),
          ),
        ),
        ),
        Expanded(child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.green),
            ),
            onPressed: () {
              checkAnswer(false);
            },
            child: const Text('False',
            style: TextStyle(
              color: Colors.white,
            ),),
          ),
        ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}


  
  
  







