import 'package:questcovid/main.dart';
import 'package:questcovid/screens_form/dados_aluno2.dart';
import 'package:flutter/material.dart';

//Respostas resposta = new Respostas();
final nomeController = TextEditingController();
final matriculaController = TextEditingController();

class DadosProfessor extends StatelessWidget {
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
                  "Informe seus dados abaixo",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(
                  controller: nomeController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Nome",
                    labelStyle: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                ),
                TextFormField(
                  controller: matriculaController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Código",
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
                          resposta.matricula = matriculaController.text;
                          resposta.nome = nomeController.text;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Dados2(resposta: resposta,)));
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
