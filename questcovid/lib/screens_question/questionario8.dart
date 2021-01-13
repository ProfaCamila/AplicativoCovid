import 'package:questcovid/login/login.dart';
import 'package:questcovid/main.dart';
import 'package:questcovid/model/respostas.dart';
import 'package:questcovid/model/respostas_aluno.dart';
import 'package:questcovid/repository/resposta_repository.dart';
import 'package:questcovid/screens_form/dados_aluno.dart';
import 'package:questcovid/screens_question/questionario9.dart';
import 'package:questcovid/screens_question/questionarioresposta.dart';
import 'package:flutter/material.dart';

class Sintomas extends StatefulWidget {
  final Respostas resposta;
  Sintomas({@required this.resposta});
  @override
  _SintomasState createState() => new _SintomasState();
}

class _SintomasState extends State<Sintomas> {
  final RespostaRepository repository = RespostaRepository();
  bool _loading = true;
  String mensagemPrincipal;
  String mensagemSecundaria;
  bool adversidade = false;

  bool _value1 = false;
  bool _value2 = false;
  bool _value3 = false;
  bool _value4 = false;
  bool _value5 = false;
  bool _value6 = false;
  bool _value7 = false;
  bool _value8 = false;
  bool _value9 = false;
  bool _value10 = false;
  bool _value11 = false;

  void _value1Changed(bool value) => setState(() => _value1 = value);
  void _value2Changed(bool value) => setState(() => _value2 = value);
  void _value3Changed(bool value) => setState(() => _value3 = value);
  void _value4Changed(bool value) => setState(() => _value4 = value);
  void _value5Changed(bool value) => setState(() => _value5 = value);
  void _value6Changed(bool value) => setState(() => _value6 = value);
  void _value7Changed(bool value) => setState(() => _value7 = value);
  void _value8Changed(bool value) => setState(() => _value8 = value);
  void _value9Changed(bool value) => setState(() => _value9 = value);
  void _value10Changed(bool value) => setState(() => _value10 = value);
  void _value11Changed(bool value) => setState(() => _value11 = value);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text('Pergunta 7 de 8'), backgroundColor: Colors.green),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new ListView(
            children: <Widget>[
              Text(
                "ESTÁ APRESENTANDO ALGUM DOS SINTOMAS ABAIXO?",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              new CheckboxListTile(
                value: _value1,
                onChanged: _value1Changed,
                title: new Text('Febre/Calafrios'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.blue,
              ),
              new CheckboxListTile(
                value: _value2,
                onChanged: _value2Changed,
                title: new Text('Fraqueza'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.blue,
              ),
              new CheckboxListTile(
                value: _value3,
                onChanged: _value3Changed,
                title: new Text('Tosse'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.blue,
              ),
              new CheckboxListTile(
                value: _value4,
                onChanged: _value4Changed,
                title: new Text('Dor de Garganta'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.blue,
              ),
              new CheckboxListTile(
                value: _value5,
                onChanged: _value5Changed,
                title: new Text('Coriza'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.blue,
              ),
              new CheckboxListTile(
                value: _value6,
                onChanged: _value6Changed,
                title: new Text('Dispneia'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.blue,
              ),
              new CheckboxListTile(
                value: _value7,
                onChanged: _value7Changed,
                title: new Text('Diarreia'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.blue,
              ),
              new CheckboxListTile(
                value: _value8,
                onChanged: _value8Changed,
                title: new Text('Náusea/vômitos'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.blue,
              ),
              new CheckboxListTile(
                value: _value9,
                onChanged: _value9Changed,
                title: new Text('Dor de Cabeça'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.blue,
              ),
              new CheckboxListTile(
                value: _value10,
                onChanged: _value10Changed,
                title: new Text('Irritabilidade/Confusão Mental'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.blue,
              ),
              new CheckboxListTile(
                value: _value11,
                onChanged: _value11Changed,
                title: new Text('Outros'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.blue,
              ),
              ButtonTheme(
                height: 60.0,
                child: RaisedButton(
                  onPressed: () {
                    if (_value1 == true) {
                      resposta.sintomas.add('Febre/Calafrios');
                    }
                    if (_value2 == true) {
                      resposta.sintomas.add('Fraqueza');
                    }
                    if (_value3 == true) {
                      resposta.sintomas.add('Tosse');
                    }
                    if (_value4 == true) {
                      resposta.sintomas.add('Dor de Garganta');
                    }
                    if (_value5 == true) {
                      resposta.sintomas.add('Coriza');
                    }
                    if (_value6 == true) {
                      resposta.sintomas.add('Dispneia');
                    }
                    if (_value7 == true) {
                      resposta.sintomas.add('Diarréia');
                    }
                    if (_value8 == true) {
                      resposta.sintomas.add('Náusea/Vômitos');
                    }
                    if (_value9 == true) {
                      resposta.sintomas.add('Dor de Cabeça');
                    }
                    if (_value10 == true) {
                      resposta.sintomas.add('Irritabilidade/Confusão Mental');
                    }
                    if (_value11 == true) {
                      resposta.sintomas.add('Outros');
                    }
                    if (resposta.sintomas.length > 0) {
                      mensagemSecundaria =
                          "Possui o(s) seguinte(s) sintoma(s):\n\n";
                      mensagemPrincipal = "";
                      for (String item in resposta.sintomas) {
                        mensagemPrincipal += "- " + item + "\n\n";
                      }
                      mensagemPrincipal +=
                          "A presença desses sintomas pode indicar que você tem alguma chance de estar contaminado. Recomenda-se que você máscara, mantenha o distanciamento social e em caso de agravamento, procure atendimento médico o mais rápido possível.";
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
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Comorbidades(
                                    resposta: resposta,
                                  )));
                    }
                  },
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(0)),
                  child: Text(
                    "Próximo",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
