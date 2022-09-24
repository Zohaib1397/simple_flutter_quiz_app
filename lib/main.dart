import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quiz_app/quizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBank = QuizBrain();

void main() {
  runApp(const MaterialApp(home: quiz_home()));
}

class quiz_home extends StatefulWidget {
  const quiz_home({Key? key}) : super(key: key);

  @override
  State<quiz_home> createState() => _quiz_homeState();
}

class _quiz_homeState extends State<quiz_home> {
  Text customText({
    required String message,
    TextStyle style = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    ),
  }) {
    return Text(
      message,
      style: style,
    );
  }

  Padding customButton(
      {required String text,
      var padding = const EdgeInsets.all(20.0),
      Color color = Colors.green,
      required onPressed}) {
    return Padding(
      padding: padding,
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: double.infinity,
        height: 100.0,
        color: color,
        child: customText(message: text),
      ),
    );
  }

  void answerSheetIcon(
    IconData icon,
    Color color,
  ) {
    recordKeeper.add(Icon(
      icon,
      color: color,
    ));
  }

  List<Widget> recordKeeper = [];

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = quizBank.getQuizAnswer();
    setState(() {
      if (userAnswer == correctAnswer) {
        answerSheetIcon(Icons.check, Colors.green);
      } else {
        answerSheetIcon(Icons.close, Colors.red);
      }
      if (quizBank.isFinished()) {
        Alert(
          context: context,
          type: AlertType.success,
          title: 'Quiz Finished',
          desc: 'You have Successfully made it to end :)',
          buttons: [
            DialogButton(
              onPressed: () {
                setState(() {
                  quizBank.reset();
                  recordKeeper = [];
                  return Navigator.pop(context);
                });
              },
              width: 120.0,
              child: const Text('Restart',
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ),
            DialogButton(
              color: Colors.red,
              onPressed: () {
                setState(() {
                  quizBank.reset();
                  recordKeeper = [];
                  exit(0);
                });
              },
              width: 120.0,
              child: const Text(
                'Close App',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ).show();
      } else {
        quizBank.checkNumber();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                  child: customText(
                message: quizBank.getQuizQuestion(),
              )),
            ),
            Column(
              children: [
                customButton(
                  text: 'True',
                  onPressed: () {
                    checkAnswer(true);
                  },
                ),
                customButton(
                  text: 'False',
                  color: Colors.red,
                  onPressed: () {
                    checkAnswer(false);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: recordKeeper,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
