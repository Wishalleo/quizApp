import 'package:flutter/material.dart';
import 'package:quiz_learn/core/data/questions.dart';
import 'package:quiz_learn/presention/start/start_screen.dart';
import 'package:quiz_learn/presention/widgets/answer_button.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  Widget? activeScreen;
  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(switchScreen);
  }

  void switchScreen() {
    setState(() {
      // activeScreen = QuestionScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    var numberQuestion = 0;
    final currentQuestion = questions[numberQuestion];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            // cara simple MAP LIST and SPREADING VALUE (...) pada data
            ...currentQuestion.getShuffleAnswer().map((answer) {
              return AnswerButton(onTap: () {}, answerText: answer);
            }),
            // AnswerButton(onTap: () {}, answerText: currentQuestion.answer[0]),
            // AnswerButton(onTap: () {}, answerText: currentQuestion.answer[1]),
            // AnswerButton(onTap: () {}, answerText: currentQuestion.answer[2]),
            // AnswerButton(onTap: () {}, answerText: currentQuestion.answer[3]),
          ],
        ),
      ),
    );
  }
}
