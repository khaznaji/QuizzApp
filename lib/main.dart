import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const _questions = [
    {
      'questionText': 'What\'s your favourite color ?',
      'answers': [
        {'text': 'Black', 'score': 1},
        {'text': 'Red', 'score': 1},
        {'text': 'Green', 'score': 1}
      ]
    },
    {
      'questionText': 'What\'s your favourite animal ?',
      'answers': [
        {'text': 'Cat', 'score': 1},
        {'text': 'Dog', 'score': 7},
        {'text': 'Rabbit', 'score': 3}
      ]
    },
    {
      'questionText': 'Who\'s your favourite singer ?',
      'answers': [
        {'text': 'Selena Gomez', 'score': 1},
        {'text': 'Ed Sheran', 'score': 1},
        {'text': 'Taylor Swift', 'score': 1}
      ]
    }
  ];
  var _questionIndex = 0;
  var _totalscore = 0;
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalscore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalscore = _totalscore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions! ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex)
            : Result(_totalscore, _resetQuiz),
      ),
    );
  }
}
