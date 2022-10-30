import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final void Function() whenRestartForm;

  const Result(this.score, this.whenRestartForm, {super.key});

  String get resultText {
    if (score < 8) {
      return 'Parabéns!';
    } else if (score < 12) {
      return 'Você é bom!';
    } else if (score < 16) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            resultText,
            style: const TextStyle(fontSize: 25),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 35, 0, 0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 16),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            onPressed: whenRestartForm,
            child: const Text('Reiniciar'),
          ),
        )
      ],
    );
  }
}
