import 'package:flutter/material.dart';
import 'package:quiz_learn/presention/quiz/quiz_screen.dart';
import 'package:quiz_learn/presention/start/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  bool activeScreen = true;
  List<String> selectedAnswer = [];
  void switchScreen() {
    setState(() {
      activeScreen = false;
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
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
        child: activeScreen
            ? StartScreen(switchScreen)
            : QuizScreen(onSelectedAnswer: chooseAnswer),
      ),
    );
  }
}
