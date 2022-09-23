import 'package:flutter/material.dart';

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

  List<Widget> recordKeeper = [];
  List questions = [
    'My name is Zohaib Ahmed',
    'Osama is a wonderful person',
    'Moiz is the nicest person in the world',
    'I have a Potato friend named Osama',
  ];
  List<bool> answers = [
    true,
    false,
    true,
    true,
  ];
  int currentQuestion = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: Center(
                      child: customText(
                    message: questions[currentQuestion],
                  )),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    customButton(
                      text: 'True',
                      onPressed: () {
                        setState(() {
                          if (answers[currentQuestion]) {
                            recordKeeper.add(const Icon(
                              Icons.check,
                              color: Colors.green,
                            ));
                          } else {
                            recordKeeper.add(const Icon(
                              Icons.close,
                              color: Colors.red,
                            ));
                          }
                          if (currentQuestion == 3) {
                            currentQuestion = 0;
                          } else {
                            currentQuestion++;
                          }
                        });
                      },
                    ),
                    customButton(
                      text: 'False',
                      color: Colors.red,
                      onPressed: () {
                        setState(() {
                          if (answers[currentQuestion] == false) {
                            recordKeeper.add(const Icon(
                              Icons.check,
                              color: Colors.green,
                            ));
                          } else {
                            recordKeeper.add(const Icon(
                              Icons.close,
                              color: Colors.red,
                            ));
                          }
                          if (currentQuestion == 3) {
                            currentQuestion = 0;
                          } else {
                            currentQuestion++;
                          }
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
