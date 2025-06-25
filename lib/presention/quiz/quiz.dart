import 'package:flutter/material.dart';
import 'package:quiz_learn/core/data/questions.dart';
import 'package:quiz_learn/presention/quiz/quiz_screen.dart';
import 'package:quiz_learn/presention/result/result_screen.dart';
import 'package:quiz_learn/presention/start/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  List<String> selectedAnswer = [];
  void switchScreen() {
    setState(() {
      activeScreen = 'quiz-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 107, 15, 168),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: activeScreen == 'start-screen'
            ? StartScreen(switchScreen)
            : activeScreen == 'quiz-screen'
            ? QuizScreen(onSelectedAnswer: chooseAnswer)
            : ResultScreen(chosenAnswers: selectedAnswer),
      ),
    );
  }
}
