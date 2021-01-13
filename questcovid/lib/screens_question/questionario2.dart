import 'package:questcovid/main.dart';
import 'package:questcovid/model/respostas.dart';
import 'package:questcovid/model/respostas_aluno.dart';
import 'package:questcovid/repository/resposta_repository.dart';
import 'package:questcovid/screens_question/questionario3.dart';
import 'package:questcovid/screens_question/questionarioresposta.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class QuestionarioPage2 extends StatefulWidget {
  final Respostas resposta;
  QuestionarioPage2({@required this.resposta});
  @override
  _QuestionarioPageState2 createState() => _QuestionarioPageState2();
}

class _QuestionarioPageState2 extends State<QuestionarioPage2> {
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
        title: Text('Pergunta 3 de 8'),
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
              image: AssetImage("assets/diagnosticocovid.png"),
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
            "Teve Diagnóstico confirmado para o COVID-19?",
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
                "Há mais de 15 dias",
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
            resposta.questao3 = 'Confirmado há mais de 14 dias';
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => QuestionarioPage3(
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
                "Há menos de 15 dias",
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
            resposta.questao3 = 'Confirmado há menos de 15 dias';
            mensagemSecundaria = "Confirmado há menos de 15 dias";
            mensagemPrincipal =
                "Recomenda-se que você fique em casa por 14 dias após o diagnóstico da doença, período no qual você pode transmitir a doença para outras pessoas. Fique o tempo todo de máscara, mesmo dentro de casa, use sempre álcool em gel. Mesmo depois de recuperado, use máscara e evite aglomeração";
            adversidade = true;
            RespostaAluno novaResposta = RespostaAluno(
                resposta.veracidade,
                resposta.uid,
                resposta.cadastrado,
                resposta.tipopessoa,
                resposta.nome,
                resposta.email,
                resposta.matricula,
                resposta.cursoSetor,
                resposta.idade,
                resposta.sexo,
                resposta.cidade,
                resposta.questao3,
                resposta.questao4,
                resposta.questao7,
                resposta.questao8,
                resposta.sintomas,
                resposta.comorbidades);
            repository.addResposta(novaResposta);
            FinishDialog.show(context,
                resposta: resposta,
                mensagemPrincipal: mensagemPrincipal,
                mensagemSecundaria: mensagemSecundaria,
                adversidade: adversidade);
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
                "Nunca Teve",
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
            resposta.questao3 = 'Nunca teve';
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => QuestionarioPage3(
                        resposta: resposta,
                      )),
            );
          },
        ),
      ),
    );
  }
}