import 'package:flutter/material.dart';

class Respostas extends StatelessWidget {

  final String texto;
  final void Function() selecionado;

  Respostas (this.texto, this.selecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: selecionado,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
          foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
          textStyle: WidgetStateProperty.all<TextStyle>(
            const TextStyle(fontSize: 18)
          ),
        ),
        child: Text(texto),
      ),
    );
  }
}