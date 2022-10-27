import 'package:flutter/material.dart';

class Response extends StatelessWidget {
  final String text;
  final void Function() whenSelected;

  const Response(this.text, this.whenSelected, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: whenSelected,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        child: Text(text),
      ),
    );
  }
}
