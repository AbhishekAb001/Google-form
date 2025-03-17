import 'package:flutter/material.dart';
import 'package:google_form/controller/QuizProvider.dart';
import 'package:google_form/view/quiz_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => QuizProvider())],

      child: MaterialApp(debugShowCheckedModeBanner: false, home: QuizScreen()),
    );
  }
}
