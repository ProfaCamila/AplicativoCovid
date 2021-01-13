import 'package:questcovid/main.dart';
import 'package:questcovid/model/respostas.dart';
import 'package:questcovid/screens_form/cidade.dart';
import 'package:flutter/material.dart';
import 'package:questcovid/screens_question/inicioquestionario.dart';

class Curso extends StatefulWidget {
  final Respostas resposta;
  Curso({@required this.resposta});
  @override
  _CursoState createState() => _CursoState();
}

class _CursoState extends State<Curso> {
  String nomeCurso = "";
  var _cursos = [
    'Administração',
    'Agronomia',
    'Arquitetura e Urbanismo',
    'Biomedicina',
    'Ciência da Computação',
    'Ciências Contábeis',
    'Direito',
    'Educação Física',
    'Enfermagem',
    'Farmácia',
    'Fitoterapia',
    'Medicina',
    'Medicina Veterinária',
    'Nutrição',
    'Odontologia',
    'Pedagogia',
    'Psicologia',
  ];
  var _itemSelecionado = 'Administração';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Curso"),
        backgroundColor: Colors.green,
      ),
      body: criaDropDownButton(),
    );
  }

  criaDropDownButton() {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 40, right: 40),
      child: ListView(
        children: <Widget>[
          Container(
            width: 300,
            height: 300,
            alignment: Alignment(0.0, 1.15),
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: AssetImage("assets/curso.png"),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Text(
            "Qual seu Curso",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
          ),
          DropdownButton<String>(
            items: _cursos.map((String dropDownStringItem) {
              return DropdownMenuItem<String>(
                value: dropDownStringItem,
                child: Text(
                  dropDownStringItem,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
              );
            }).toList(),
            onChanged: (String novoItemSelecionado) {
              _dropDownItemSelected(novoItemSelecionado);
              setState(() {
                this._itemSelecionado = novoItemSelecionado;
              });
            },
            value: _itemSelecionado,
          ),
          SizedBox(
            height: 20,
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
                    "Próximo",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    resposta.cursoSetor = _itemSelecionado.toString();
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
    );
  }

  void _dropDownItemSelected(String novoItem) {
    setState(() {
      this._itemSelecionado = novoItem;
    });
  }
}
