import 'package:questcovid/login/login.dart';
import 'package:questcovid/main.dart';
import 'package:questcovid/model/respostas.dart';
import 'package:questcovid/model/respostas_aluno.dart';
import 'package:questcovid/repository/resposta_repository.dart';
import 'package:questcovid/screens_form/dados_aluno.dart';
import 'package:questcovid/screens_question/questionarioresposta.dart';
import 'package:flutter/material.dart';

class Comorbidades extends StatefulWidget {
  final Respostas resposta;
  Comorbidades({@required this.resposta});
  @override
  _ComorbidadesState createState() => new _ComorbidadesState();
}

class _ComorbidadesState extends State<Comorbidades> {
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
          title: new Text('Pergunta 8 de 8'), backgroundColor: Colors.green),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new ListView(
            children: <Widget>[
              Text(
                "POSSUI ALGUMA DESSAS DOENÇAS?",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              new CheckboxListTile(
                value: _value1,
                onChanged: _value1Changed,
                title: new Text('Doença Cardiovascular(Coração)'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.blue,
              ),
              new CheckboxListTile(
                value: _value2,
                onChanged: _value2Changed,
                title: new Text('Diabetes'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.blue,
              ),
              new CheckboxListTile(
                value: _value3,
                onChanged: _value3Changed,
                title: new Text('Doença Hepática(Fígado)'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.blue,
              ),
              new CheckboxListTile(
                value: _value4,
                onChanged: _value4Changed,
                title: new Text('Doença Neurológica(Cérebro)'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.blue,
              ),
              new CheckboxListTile(
                value: _value5,
                onChanged: _value5Changed,
                title: new Text('Doença Renal(Rins)'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.blue,
              ),
              new CheckboxListTile(
                value: _value6,
                onChanged: _value6Changed,
                title: new Text('Doença Pulmonar Crônica/Asma'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.blue,
              ),
              new CheckboxListTile(
                value: _value7,
                onChanged: _value7Changed,
                title: new Text('Doença Imunossupressora(Autoimune)'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.blue,
              ),
              new CheckboxListTile(
                value: _value8,
                onChanged: _value8Changed,
                title: new Text('IMC maior que 40'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.blue,
              ),
              ButtonTheme(
                height: 60.0,
                child: RaisedButton(
                  onPressed: () {
                    if (_value1 == true) {
                      resposta.comorbidades
                          .add('Doença Cardiovascular(Coração)');
                    }
                    if (_value2 == true) {
                      resposta.comorbidades.add('Diabetes');
                    }
                    if (_value3 == true) {
                      resposta.comorbidades.add('Doença Hepática(Fígado)');
                    }
                    if (_value4 == true) {
                      resposta.comorbidades.add('Doença Neurológica(Cérebro)');
                    }
                    if (_value5 == true) {
                      resposta.comorbidades.add('Doença Renal(Rins)');
                    }
                    if (_value6 == true) {
                      resposta.comorbidades.add('Doença Pulmonar Crônica/Asma');
                    }
                    if (_value7 == true) {
                      resposta.comorbidades
                          .add('Doença Imunossupressora(Autoimune)');
                    }
                    if (_value8 == true) {
                      resposta.comorbidades.add('IMC>40');
                    }
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
                    if (resposta.comorbidades.length > 0) {
                      mensagemSecundaria = "É do grupo de risco";
                      mensagemPrincipal =
                          "Possui a(s) seguinte(s) doenças(s):\n\n";
                      for (String item in resposta.comorbidades) {
                        mensagemPrincipal += "- " + item + "\n\n";
                      }
                      adversidade = true;
                      FinishDialog.show(context,
                          resposta: resposta,
                          mensagemPrincipal: mensagemPrincipal,
                          mensagemSecundaria: mensagemSecundaria,
                          adversidade: adversidade);
                    } else {
                      if(resposta.questao7=="Não" && resposta.questao8=="Não")
                      {
                        adversidade=true;
                        mensagemSecundaria = "Algo errado...";
                        mensagemPrincipal =
                          "Apesar de não possuir sintomas e não estar no grupo de risco, você nem tem usado máscara e nem esteve em isolamento social, recomenda-se que faça o exame para o covid-19, em caso de confirmação fique em casa e tome todas as medidas preventivas. Recomenda-se que passe a usar máscara no seu dia-a-dia, use álcool em gel e evite sair desnecessariamente";
                          FinishDialog.show(context,
                          resposta: resposta,
                          mensagemPrincipal: mensagemPrincipal,
                          mensagemSecundaria: mensagemSecundaria,
                          adversidade: adversidade);
                      }
                      else {

                      } if(resposta.questao8=="Não") {
                         adversidade=true;
                        mensagemSecundaria = "Algo errado...";
                        mensagemPrincipal =
                          "Apesar de não possuir sintomas e não estar no grupo de risco, você nem tem usado máscara, recomenda-se que faça o exame para o covid-19, em caso de confirmação fique em casa e tome todas as medidas preventivas. Recomenda-se que passe a usar máscara no seu dia-a-dia, use álcool em gel e evite sair desnecessariamente";
                          FinishDialog.show(context,
                          resposta: resposta,
                          mensagemPrincipal: mensagemPrincipal,
                          mensagemSecundaria: mensagemSecundaria,
                          adversidade: adversidade);

                      }
                      else
                      {
                        adversidade = false;
                      mensagemSecundaria = "Tudo Certo!!";
                      mensagemPrincipal =
                          "Você está liberado, mas continue com as medidas preventivas, para não contrair a doença";
                      FinishDialog.show(context,
                          resposta: resposta,
                          mensagemPrincipal: mensagemPrincipal,
                          mensagemSecundaria: mensagemSecundaria,
                          adversidade: adversidade);
                      }
      
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
