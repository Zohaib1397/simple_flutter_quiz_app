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
                  child:
                      Center(child: customText(message: 'This is the message')),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    customButton(
                      text: 'Yes',
                      onPressed: () {},
                    ),
                    customButton(
                      text: 'No',
                      color: Colors.red,
                      onPressed: () {},
                    ),
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
