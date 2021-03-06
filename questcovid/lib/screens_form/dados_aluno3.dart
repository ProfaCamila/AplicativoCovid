import 'package:questcovid/model/respostas.dart';
import 'package:questcovid/screens_question/inicioquestionario.dart';
import 'package:flutter/material.dart';

class Dados3 extends StatelessWidget {
  final cidadeController = TextEditingController();
  final estadoController = TextEditingController();
  final localtrabalhoController = TextEditingController();
  final cursoController = TextEditingController();
  final Respostas resposta;
  String nomeCidade = "";
  var _cidades = ['Alfenas', 'Belo Horizonte', 'Campo Belo', 'Varginha'];
  var _itemSelecionado = 'Alfenas';
  Dados3({@required this.resposta});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Preencha seus dados " + resposta.nome),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10, left: 40, right: 40),
        child: ListView(
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              alignment: Alignment(0.0, 1.15),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: AssetImage("assets/cadastro.jpg"),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: cidadeController,
              autofocus: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Cidade",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: cursoController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Curso/Setor",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
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
                      "Cadastrar",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      resposta.cidade = cidadeController.text;
                      resposta.cursoSetor = cursoController.text;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InicioQuestionarioPage(
                                  resposta: resposta,
                                )),
                      );
                    }),
              ),
            ),
            SizedBox(
              height: 10,
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
    );
  }
}
