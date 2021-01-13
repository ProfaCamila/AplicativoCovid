import 'package:questcovid/login/login.dart';
import 'package:questcovid/main.dart';
import 'package:questcovid/model/respostas.dart';
import 'package:questcovid/model/respostas_aluno.dart';
import 'package:questcovid/repository/resposta_repository.dart';
import 'package:questcovid/screens_form/dados_aluno.dart';
import 'package:questcovid/screens_question/questionario6.dart';
import 'package:questcovid/screens_question/questionarioresposta.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class QuestionarioPage3 extends StatefulWidget {
  final Respostas resposta;
  QuestionarioPage3({@required this.resposta});
  @override
  _QuestionarioPageState3 createState() => _QuestionarioPageState3();
}

class _QuestionarioPageState3 extends State<QuestionarioPage3> {
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
        title: Text('Questão 4 de 8'),
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
              image: AssetImage("assets/moratrabalha.png"),
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
            "Mora ou trabalha com alguém que apresentou o diagnóstico para COVID-19, nos últimos 15 dias?",
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
            resposta.questao4 = 'Sim';
            mensagemSecundaria =
                "Mora ou trabalha com alguém que apresentou o diagnóstico para COVID-19";
            mensagemPrincipal =
                "Você pode estar infectado pelo novo coronavírus, mesmo que não tenha nenhum sintoma.Use sempre máscara e mantenha o distanciamento social para sua proteção e para proteção das outras pessoas. Se apresentar algum sintoma, como tosse, falta de ar, procure atendimento médico.";
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
            resposta.questao4 = 'Não';
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => QuestionarioPage6(
                        resposta: resposta,
                      )),
            );
          },
        ),
      ),
    );
  }
}
