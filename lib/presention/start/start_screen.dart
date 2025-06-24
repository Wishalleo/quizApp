import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            height: 300,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 50),
          Text(
            'Learn Flutter the Fun Way!',
            style: GoogleFonts.lato(color: Colors.white, fontSize: 25),
          ),
          SizedBox(height: 25),
          InkWell(
            onTap: startQuiz,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_right_alt_rounded,
                  color: Colors.white,
                  size: 30,
                ),
                Text(
                  'Start Quiz',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
