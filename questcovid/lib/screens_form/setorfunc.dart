import 'package:questcovid/main.dart';
import 'package:questcovid/model/respostas.dart';
import 'package:questcovid/screens_form/cidade.dart';
import 'package:questcovid/screens_form/dados_aluno2.dart';
import 'package:flutter/material.dart';
import 'package:questcovid/screens_question/inicioquestionario.dart';

final setorCursoController = TextEditingController();

class CursoSetor extends StatelessWidget {
  final Respostas resposta;
  CursoSetor({@required this.resposta});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text('Cadastro'),
          backgroundColor: Colors.green,
        ),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: ListView(
              children: <Widget>[
                Container(
                  width: 200,
                  height: 200,
                  alignment: Alignment(0.0, 1.15),
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: AssetImage("assets/login.png"),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  alignment: Alignment.center,
                ),
                Text(
                  "Informe o setor/curso que você trabalha",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(
                  controller: setorCursoController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Setor/Curso",
                    labelStyle: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent[700],
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: SizedBox.expand(
                    child: FlatButton(
                        color: Colors.green,
                        child: Text(
                          "Entrar",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          resposta.cursoSetor = setorCursoController.text;
                           Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InicioQuestionarioPage(resposta: null)));
                        }),
                  ),
                ),
                Container(
                  width: 200,
                  height: 200,
                  alignment: Alignment(0.0, 1.15),
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: AssetImage("assets/unifenas.jpeg"),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}