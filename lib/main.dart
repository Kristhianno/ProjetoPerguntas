import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': ' Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Azul', 'pontuação': 1},
        {'texto': 'Amarelo', 'pontuação': 8},
        {'texto': 'Roxo', 'pontuação': 6},
        {'texto': 'Rosa', 'pontuação': 9},
      ],
    },
    {
      'texto': 'Qual é o seu Animal favorito?',
      'respostas': [
        {'texto': 'Arara', 'pontuação': 8},
        {'texto': 'Camelo', 'pontuação': 5},
        {'texto': 'Jacaré', 'pontuação': 7},
        {'texto': 'Tamanduá', 'pontuação': 1},
      ],
    },
    {
      'texto': 'Qual é a sua Comida favorita?',
      'respostas': [
        {'texto': 'Macarrão', 'pontuação': 3},
        {'texto': 'Churrasco', 'pontuação': 5},
        {'texto': 'Pizza', 'pontuação': 4},
        {'texto': 'Pamonha', 'pontuação': 9},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    //List<Widget> widgets = respostas
    // .map((t) => Resposta(t, _responder))
    // .toList() ;

    // ABORDAGEM MAIS IMPERATIVA!!
    // List<Widget> respostas = [];

    // // for (String textoResp
    // //     in perguntas[_perguntaSelecionada].cast()['respostas']) {
    // //   respostas.add(Resposta(textoResp, _responder));
    // // }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
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
