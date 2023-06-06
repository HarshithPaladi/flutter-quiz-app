import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var questionIndex = 0;
  var score = 0;
  var quizCompleted = false;

  // Create a list of maps with key-value pairs of question and answers and correct answer
  var QnA = [
    {
      'question': "What is the capital of India?",
      'options': ['Mumbai', 'New Delhi', 'Chennai', 'Kolkata'],
      'answer': 'New Delhi'
    },
    {
      'question': 'What is the capital of Malaysia?',
      'options': ['Kuala Lumpur', 'Putrajaya', 'Shah Alam', 'Petaling Jaya'],
      'answer': 'Kuala Lumpur'
    },
    {
      'question': "What is the capital of Indonesia?",
      'options': ['Jakarta', 'Bandung', 'Surabaya', 'Medan'],
      'answer': 'Jakarta'
    },
    {
      'question': "What is the capital of Singapore?",
      'options': ['Singapore', 'Kuala Lumpur', 'Bangkok', 'Manila'],
      'answer': 'Singapore'
    },
    {
      'question': "What is the capital of Thailand?",
      'options': ['Bangkok', 'Phuket', 'Chiang Mai', 'Pattaya'],
      'answer': 'Bangkok'
    }
  ];

  void reset() {
    setState(() {
      questionIndex = 0;
      score = 0;
      quizCompleted = false;
    });
  }

  void answerQuestion(String answer) {
    setState(() {
      if (answer == QnA[questionIndex]['answer']) {
        score += 1;
      }

      questionIndex += 1;

      if (questionIndex >= QnA.length) {
        quizCompleted = true;
      }
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Flutter #001'),
          ),
        ),
        body: Center(
          child: quizCompleted
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Quiz Completed',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      'Score: $score',
                      style: TextStyle(fontSize: 18),
                    ),
                    ElevatedButton(
                      onPressed: reset,
                      child: Text('Reset'),
                    ),
                  ],
                )
              : Column(
                  children: <Widget>[
                    Question(QnA[questionIndex]['question'].toString()),
                    ...(QnA[questionIndex]['options'] as List<String>)
                        .map((answer) {
                      return Answer(() => answerQuestion(answer), answer);
                    }).toList(),
                    ElevatedButton(
                      onPressed: reset,
                      child: Text('Reset'),
                    ),
                    Text('Score: $score'),
                  ],
                ),
        ),
      ),
    );
  }
}
