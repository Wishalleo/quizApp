import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_learn/core/data/questions.dart';
import 'package:quiz_learn/presention/quiz/quiz.dart';
import 'package:quiz_learn/presention/widgets/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({required this.chosenAnswers, super.key});
  final List<String> chosenAnswers;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answer[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestion = questions.length;
    final numCorrectQuestion = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Answer $numCorrectQuestion out of $numTotalQuestion questions correctly!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 218, 159, 255),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            QuestionsSummary(summaryData),
            TextButton.icon(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const Quiz()),
                  (route) => false,
                );
              },
              label: Text('Restart Quiz!'),
              icon: Icon(Icons.restart_alt),
            ),
          ],
        ),
      ),
    );
  }
}
