import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_learn/core/data/questions.dart';
import 'package:quiz_learn/presention/widgets/answer_button.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({required this.onSelectedAnswer, super.key});
  final void Function(String answer) onSelectedAnswer;
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
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
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 209, 145, 232),
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 20),
            // cara simple MAP LIST and SPREADING VALUE (...) pada data
            ...currentQuestion.getShuffleAnswer().map((answer) {
              return AnswerButton(
                onTap: () => answerQuestion(answer),
                answerText: answer,
              );
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
