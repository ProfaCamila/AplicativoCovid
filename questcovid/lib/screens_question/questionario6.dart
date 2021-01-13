import 'package:questcovid/main.dart';
import 'package:questcovid/model/respostas.dart';
import 'package:questcovid/model/respostas_aluno.dart';
import 'package:questcovid/repository/resposta_repository.dart';
import 'package:questcovid/screens_form/dados_aluno.dart';
import 'package:questcovid/screens_question/questionario7.dart';
import 'package:questcovid/screens_question/questionarioresposta.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class QuestionarioPage6 extends StatefulWidget {
  final Respostas resposta;
  QuestionarioPage6({@required this.resposta});
  @override
  _QuestionarioPageState6 createState() => _QuestionarioPageState6();
}

class _QuestionarioPageState6 extends State<QuestionarioPage6> {
  final RespostaRepository repository = RespostaRepository();
  bool _loading = true;
  String mensagemPrincipal;
  String mensagemSecundaria;
  bool adversidade = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Pergunta 5 de 8'),
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
              image: AssetImage("assets/isolamento.png"),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        _buildQuestion(),
        _buildAnswerButton1(),
        _buildAnswerButton2(),
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
            "Ficou em isoladomento social nos últimos 15 dias?",
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
                "Sim",
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
            resposta.questao7 = 'Sim';
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => QuestionarioPage7(
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
                "Não",
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
            resposta.questao7 = 'Não';
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => QuestionarioPage7(
                        resposta: resposta,
                      )),
            );

          },
        ),
      ),
    );
  }
}
