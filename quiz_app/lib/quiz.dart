import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/results_screen.dart';

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

  List<String> selectedAnswers = [];
  var screen = 'start-screen';

  void switchScreen() {
    setState(() {
      screen = 'question-screen';
    });
  }

  void chooseanswer(String answer){
    selectedAnswers.add(answer);
    if(selectedAnswers.length==questions.length)
    {
      setState(() {
        // selectedAnswers=[];
        screen='results-screen';
      });
    }
  }


  @override
  Widget build(context) {

    Widget screenwidget=StartScreen(switchScreen);

    if(screen=='question-screen'){
      screenwidget=QuestionsScreen(onSelectAnswer: chooseanswer);
    } else if(screen=='results-screen') {
      screenwidget=ResultsScreen(choosenanswers: selectedAnswers,);
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
