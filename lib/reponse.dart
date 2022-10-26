import 'package:flutter/material.dart';

class Response extends StatelessWidget {
  final String text;
  final void Function() quandoSelecionado;

  const Response(this.text, this.quandoSelecionado, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: quandoSelecionado,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        child: Text(text),
      ),
    );
  }
}
