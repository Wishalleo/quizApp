import 'package:flutter/material.dart';
import 'package:quiz_learn/presention/quiz/quiz.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Quiz());
  }
}
