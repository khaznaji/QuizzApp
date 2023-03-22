import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetQuiz;
  Result(this.resultScore, this.resetQuiz);
  String get resultPhrase {
    var resultText = 'You did it! ';
    if (resultScore == 9) {
      resultText = ' You are awesome and innocent !';
    } else if (resultScore == 5) {
      resultText = ' Pretty likeable !';
    } else if (resultScore == 3) {
      resultText = 'You are ... Strange !';
    } else {
      resultText = ' You are so bad !';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: resetQuiz,
            child: const Text('Restart Quiz !'),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
          )
        ],
      ),
    );
  }
}
