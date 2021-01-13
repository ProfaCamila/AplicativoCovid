import 'package:questcovid/model/respostas.dart';
import 'package:flutter/material.dart';
import 'package:questcovid/screens_question/agradecimento.dart';

class FinishDialog {
  
  static Future show(
    BuildContext context, {
    @required Respostas resposta,
    @required String mensagemPrincipal,
    @required String mensagemSecundaria,
    @required bool adversidade,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          title: CircleAvatar(
            backgroundColor: Colors.green,
            maxRadius: 35.0,
            child: Icon(
              adversidade == true ? Icons.warning : Icons.favorite,
              color: Colors.grey.shade900,
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                mensagemSecundaria,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                mensagemPrincipal,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          actions: [
            FlatButton(
              child: const Text('Entendi'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AgradecimentoPage()),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
