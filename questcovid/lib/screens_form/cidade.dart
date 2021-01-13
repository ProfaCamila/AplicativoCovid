import 'package:questcovid/model/respostas.dart';
import 'package:questcovid/screens_form/curso.dart';
import 'package:questcovid/screens_form/setorfunc.dart';
import 'package:questcovid/screens_question/inicioquestionario.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class Cidade extends StatefulWidget {
  final Respostas resposta;
  Cidade({@required this.resposta});
  @override
  _CidadeState createState() => _CidadeState();
}

class _CidadeState extends State<Cidade> {
  String nomeCidade = "";
  var _cidades = [
    'Alfenas',
    'Belo Horizonte',
    'Campo Belo',
    'Divinópolis',
    'Poços de Caldas',
    'Varginha'
  ];
  var _itemSelecionado = 'Alfenas';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Campus"),
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
                image: AssetImage("assets/cidade.jpeg"),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Text(
            "Em qual Campus da UNIFENAS você trabalha/estuda?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
          ),
          DropdownButton<String>(
            items: _cidades.map((String dropDownStringItem) {
              return DropdownMenuItem<String>(
                value: dropDownStringItem,
                child: Text(dropDownStringItem,
                style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,),
                
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
                          resposta.cidade = _itemSelecionado.toString();
                          if(resposta.tipopessoa=="Aluno")
                   {
                     Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => Curso(resposta: resposta,)));
                   }
                   else
                   {
                     Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => CursoSetor(resposta: resposta,)));
                   }
              
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
