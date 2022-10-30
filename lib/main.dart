import 'package:flutter/material.dart';
import 'src/widgets/my_form.dart';
import 'src/widgets/result.dart';

void main(List<String> args) => runApp(const PerguntaApp());

class PerguntaAppState extends State<PerguntaApp> {
  var _selectedQuestion = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'nota': 10},
        {'texto': 'Vermelho', 'nota': 5},
        {'texto': 'Verde', 'nota': 3},
        {'texto': 'Branco', 'nota': 1},
      ],
    },
    {
      'texto': 'Qual é a seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'nota': 10},
        {'texto': 'Cobra', 'nota': 3},
        {'texto': 'Elefante', 'nota': 4},
        {'texto': 'Leão', 'nota': 7},
      ],
    },
    {
      'texto': 'Qual o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Maria', 'nota': 6},
        {'texto': 'João', 'nota': 5},
        {'texto': 'Leonardo', 'nota': 9},
        {'texto': 'Pedro', 'nota': 2},
      ],
    },
  ];

  bool get haveSelectedQuestion {
    return _selectedQuestion < _questions.length;
  }

  void _respond(int score) {
    if (haveSelectedQuestion) {
      setState(() {
        _selectedQuestion++;
        _totalScore += score;
      });
    }
  }
  
  void _restartForm() {
    setState(() {
      _selectedQuestion = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const SizedBox(
            width: double.infinity,
            child: Text(
              'Perguntas',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: haveSelectedQuestion
            ? MyForm(
                questions: _questions,
                selectedQuestion: _selectedQuestion,
                whenRespond: _respond,
              )
            : Result(_totalScore, _restartForm),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}
