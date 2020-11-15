import 'package:app_1/result.dart';
import 'package:flutter/material.dart';
import './quiz.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  final _questions = const [
    {
      'answerText': "What is your favorite color?",
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'Orange', 'score': 1},
      ],
    },
    {
      'answerText': "What is your favorite animal?",
      'answers': [
        {'text': 'Cat', 'score': 5},
        {'text': 'Tiger', 'score': 20},
        {'text': 'Panther', 'score': 1},
        {'text': 'Lion', 'score': 15},
      ],
    },
    {
      'answerText': "Who is your favorite instructor?",
      'answers': [
        {'text': 'Jenny', 'score': 1},
        {'text': 'Mike', 'score': 15},
        {'text': 'Geff', 'score': 13},
        {'text': 'Sonny', 'score': 11},
      ],
    },
  ];
  var _totalScore = 0;
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
  }

  void _reset() {
    setState(() {
      _questionIndex = 0;
    });
    _totalScore = 0;
    print("done");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _reset),
      ),
    );
  }
}
