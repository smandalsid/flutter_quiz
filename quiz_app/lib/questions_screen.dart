import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<QuestionsScreen> {
  var currquestion = 0;
  void answerquestion(String selectedanswer) {
    widget.onSelectAnswer(selectedanswer);
    setState(() {
      currquestion += 1;
    });
  }

  @override
  Widget build(context) {
    final currentquestion = questions[currquestion];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentquestion.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            // 3 dots are to spread the list to individual widgets.
            ...currentquestion.shuffled().map((answer) {
              return AnswerButton(
                  answertxt: answer,
                  ontap: () {
                    answerquestion(answer);
                  });
            })
          ],
        ),
      ),
    );
  }
}
