import 'package:questcovid/main.dart';
import 'package:questcovid/model/respostas.dart';
import 'package:questcovid/screens_form/dados_aluno.dart';
import 'package:questcovid/screens_question/questionario2.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class QuestionarioPage extends StatefulWidget {
  final Respostas resposta;
  QuestionarioPage({@required this.resposta});
  @override
  _QuestionarioPageState createState() => _QuestionarioPageState();
}

class _QuestionarioPageState extends State<QuestionarioPage> {
  bool _loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Pergunta 2 de 8"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
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
          width: 200,
          height: 200,
          alignment: Alignment(0.0, 1.15),
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: AssetImage("assets/sexo.jpg"),
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
            "Qual o seu sexo?",
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
                "Masculino",
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
            resposta.sexo = "Masculino";
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => QuestionarioPage2(
                        resposta: resposta,
                      )),
            );
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
                "Feminino",
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
            resposta.sexo = "Feminino";
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => QuestionarioPage2(
                        resposta: resposta,
                      )),
            );
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
                "Prefiro não responder",
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
            resposta.sexo = "Prefiro não responder";
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => QuestionarioPage2(
                        resposta: resposta,
                      )),
            );
          },
        ),
      ),
    );
  }
}
