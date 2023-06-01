import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciandoQuestionario;

  Resultado(this.pontuacao, this.reiniciandoQuestionario);

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Voce pode melhorar';
    } else if (pontuacao < 12) {
      return 'Você esta quase lá';
    } else if (pontuacao < 16) {
      return 'Agora sim, falta pouco';
    } else {
      return 'Sabia que conseguiria';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(fraseResultado, style: TextStyle(fontSize: 28)),
        ),
        TextButton(
          child: Text('Reiniciar ?',
              style: TextStyle(fontSize: 28, color: Colors.red)),
          onPressed: reiniciandoQuestionario,
        ),
      ],
    );
  }
}
