import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  VoidCallback selectHandler;
  String answerText;

  Answer(this.selectHandler, this.answerText);

  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: selectHandler,
        child: Text(answerText),
      ),
    );
  }
}
