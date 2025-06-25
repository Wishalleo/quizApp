import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    // final isCorrectAnswer = summaryData['user_answer'] == summaryData['correct_answer'];
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((summary) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: summary['user_answer'] == summary['correct_answer']
                        ? Colors.lightBlueAccent
                        : Colors.pinkAccent,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    ((summary['question_index'] as int) + 1).toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        summary['question'].toString(),
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        summary['user_answer'].toString(),
                        style: TextStyle(
                          color: const Color.fromARGB(255, 202, 171, 252),
                        ),
                      ),
                      Text(
                        summary['correct_answer'].toString(),
                        style: TextStyle(
                          color: const Color.fromARGB(255, 133, 151, 255),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
