import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? screen;

  // @override
  // void initState() {
  //   screen=StartScreen(switchScreen);
  //   super.initState();
  // }

  var screen = 'start-screen';

  void switchScreen() {
    setState(() {
      screen = 'question-screen';
    });
  }



  @override
  Widget build(context) {

    Widget screenwidget=StartScreen(switchScreen);

    if(screen=='question-screen'){
      screenwidget=const QuestionsScreen();
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.yellow, Colors.teal],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenwidget,
        ),
      ),
    );
  }
}
