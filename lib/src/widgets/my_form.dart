import 'package:flutter/material.dart';

import 'question.dart';
import 'response.dart';

class MyForm extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int selectedQuestion;
  final void Function(int) whenRespond;

  const MyForm({
    super.key,
    required this.questions,
    required this.selectedQuestion,
    required this.whenRespond,
  });

  bool get haveSelectedQuestion {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers = haveSelectedQuestion
        ? questions[selectedQuestion].cast()['respostas']
        : [];
    return Column(
      children: <Widget>[
        Question(questions[selectedQuestion]['texto'].toString()),
        ...answers
            .map((res) => Response(
                  res['texto'].toString(),
                  () => {whenRespond(int.parse(res['nota'].toString()))},
                ))
            .toList(),
      ],
    );
  }
}
