import 'package:flutter/material.dart';
import 'package:quiz_app/quizBrain.dart';

QuizBrain quizBank = QuizBrain();

void main() {
  runApp(quiz_home());
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                      setState(() {
                        if (quizBank.getQuizAnswer()) {
                          answerSheetIcon(Icons.check, Colors.green);
                        } else {
                          answerSheetIcon(Icons.close, Colors.red);
                        }
                        quizBank.checkNumber(context);
                      });
                    },
                  ),
                  customButton(
                    text: 'False',
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        if (quizBank.getQuizAnswer()) {
                          answerSheetIcon(Icons.close, Colors.red);
                        } else {
                          answerSheetIcon(Icons.check, Colors.green);
                        }
                        quizBank.checkNumber(context);
                      });
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
      ),
    );
  }
}
