import 'question.dart';
import 'package:flutter/material.dart';
import 'reponse.dart';

void main(List<String> args) => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      print(_perguntaSelecionada);
    });
    _perguntaSelecionada++;
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      'Qual é a sua cor favorita?',
      'Qual é a sua comida favorita?',
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            width: double.infinity,
            child: Text(
              'Perguntas',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: Column(
          children: [
            Question(perguntas[_perguntaSelecionada]),
            Response('Resposta 1', _responder),
            Response('Resposta 2', _responder),
            Response('Resposta 3', _responder),
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
