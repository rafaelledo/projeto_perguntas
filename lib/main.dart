import 'package:flutter/material.dart';
import 'src/widgets/my_form.dart';
import 'src/widgets/result.dart';

void main(List<String> args) => runApp(const PerguntaApp());

class PerguntaAppState extends State<PerguntaApp> {
  var _selectedQuestion = 0;

  final _questions = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco'],
    },
    {
      'texto': 'Qual é a seu animal favorito?',
      'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão'],
    },
    {
      'texto': 'Qual o seu instrutor favorito?',
      'respostas': ['Maria', 'João', 'Leonardo', 'Pedro'],
    },
  ];

  bool get haveSelectedQuestion {
    return _selectedQuestion < _questions.length;
  }

  void _respond() {
    if (haveSelectedQuestion) {
      setState(() {
        _selectedQuestion++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
            ? My_Form(
                questions: _questions,
                selectedQuestion: _selectedQuestion,
                respond: _respond,
              )
            : Result('Parabéns!'),
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
