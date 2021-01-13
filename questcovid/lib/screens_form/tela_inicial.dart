import 'package:questcovid/main.dart';
import 'package:questcovid/model/respostas.dart';
import 'package:questcovid/screens_form/dados_aluno.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:questcovid/screens_form/professor.dart';

import 'funcionario.dart';

class TelaInicial extends StatefulWidget {
  final Respostas resposta;
  TelaInicial({@required this.resposta});
  @override
  _TelaInicialPageState createState() => _TelaInicialPageState();
}


class _TelaInicialPageState extends State<TelaInicial> {

  bool _loading = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Bem-vindo ao QuestCovid"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: _buildQuiz(),
        ),
      ),
    );
  }

  _buildQuiz() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
         Container(
                  width: 150,
                  height: 150,
                  alignment: Alignment(0.0, 1.15),
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: AssetImage("assets/icone.jpeg"),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
        _buildQuestion(),
        _buildAnswerButton1(),
        _buildAnswerButton2(),
        _buildAnswerButton3(),
      ],
    );
  }

  _buildQuestion() {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Center(
          child: Text(
            "Você é aluno, Técnico administrativo ou professor da Unifenas?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  _buildAnswerButton1() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: GestureDetector(
          child: Container(
            padding: EdgeInsets.all(4.0),
            color: Colors.green,
            child: Center(
              child: AutoSizeText(
                "Aluno",
                maxLines: 2,
                minFontSize: 10.0,
                maxFontSize: 32.0,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          onTap: () {
            resposta.tipopessoa="Aluno";
            Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DadosAluno()),);
          },
        ),
      ),
    );
  }
  _buildAnswerButton2() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: GestureDetector(
          child: Container(
            padding: EdgeInsets.all(4.0),
            color: Colors.green,
            child: Center(
              child: AutoSizeText(
                "Técnico Admnistrativo",
                maxLines: 2,
                minFontSize: 10.0,
                maxFontSize: 32.0,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          onTap: () {
            resposta.tipopessoa="Tecnico Admnistrativo";
             Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DadosFuncionario()),);
          },
        ),
      ),
    );
  }
  _buildAnswerButton3() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: GestureDetector(
          child: Container(
            padding: EdgeInsets.all(4.0),
            color: Colors.green,
            child: Center(
              child: AutoSizeText(
                "Professor",
                maxLines: 2,
                minFontSize: 10.0,
                maxFontSize: 32.0,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          onTap: () {
            resposta.tipopessoa="Professor";
            Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DadosProfessor()),);
          },
        ),
      ),
    );
  } 
  }