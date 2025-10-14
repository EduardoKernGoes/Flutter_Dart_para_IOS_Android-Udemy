import './resultado.dart';
import './questionario.dart';
import 'package:flutter/material.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = const [
      {
        'texto': 'Qual sua cor favorita?',
        'respostas': [
          {'texto': 'Verde', 'pontuacao': 10},
          {'texto': 'Azul', 'pontuacao': 5},
          {'texto': 'Vermelho', 'pontuacao': 1},
          {'texto': 'Roxo', 'pontuacao': 3},]
      },
      {
        'texto': 'Qual seu animal favorito?',
        'respostas': [
          {'texto': 'Cachorro', 'pontuacao': 4},
          {'texto': 'Gato', 'pontuacao': 9},
          {'texto': 'Urubu', 'pontuacao': 5},
          {'texto': 'Coelho', 'pontuacao': 1}]
      },
      {
        'texto': 'Qual sua comida favorita?',
        'respostas': [
          {'texto': 'Arroz', 'pontuacao': 1},
          {'texto': 'Feijão', 'pontuacao': 5},
          {'texto': 'Galinha', 'pontuacao': 7},
          {'texto': 'Brocolis', 'pontuacao': 4}]
      }
    ];

  void _responder(int pontuacao){
    setState((){
      _perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;
    });
  }

  void _reiniciar (){
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada{
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context){

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada ? Questionario(
          perguntas: _perguntas,
          perguntaSelecionada: _perguntaSelecionada,
          responder: _responder): Resultado(_pontuacaoTotal, _reiniciar),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}