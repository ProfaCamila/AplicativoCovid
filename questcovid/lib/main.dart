import 'package:questcovid/login/login.dart';
import 'package:questcovid/model/respostas.dart';
import 'package:flutter/material.dart';

Respostas resposta = new Respostas();
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COVID-19',
      home: LoginPage(resposta: resposta,),
      theme: ThemeData(
        primarySwatch:  Colors.blue),

      );
  }
}
