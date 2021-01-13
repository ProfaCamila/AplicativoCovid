import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:questcovid/login/registerpage.dart';
import 'package:questcovid/main.dart';
import 'package:questcovid/model/respostas.dart';
import 'package:questcovid/model/respostas_aluno.dart';
import 'package:questcovid/repository/resposta_repository.dart';
import 'package:questcovid/screens_form/tela_inicial.dart';
import 'package:questcovid/screens_question/inicioquestionario.dart';
import 'package:questcovid/screens_question/questionario2.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String uid;
bool ok = false;
final RespostaRepository repository = RespostaRepository();

//stf for create a StatefulWidget
class LoginPage extends StatefulWidget {
  final Respostas resposta;
  LoginPage({@required this.resposta});
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Bem-vindo ao QuestCovid"),
          centerTitle: true,
          elevation: 0.0,
        ),
        resizeToAvoidBottomPadding: false, //evitar error bottom overflowed
        body: Form(
            key: _formKey,
          child: ListView(
            children: <Widget>[
                  Container(
                    width: 270,
                    height: 270,
                    alignment: Alignment(0.9, 1.0),
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: AssetImage("assets/icone.jpeg"),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  TextFormField(
                    maxLines: 1,
                    controller: _emailController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                        labelText: 'Email', icon: Icon(Icons.email)),
                    onFieldSubmitted: (value) {},
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Digite seu Email';
                      }
                    },
                  ),
                  TextFormField(
                    maxLines: 1,
                    controller: _passwordController,
                    textInputAction: TextInputAction.next,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                      labelText: 'Senha',
                      icon: Icon(
                        Icons.vpn_key,
                        color: Colors.black,
                      ),
                    ),
                    onFieldSubmitted: (value) {},
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Digite sua senha';
                      }
                    },
                  ),
                  new RaisedButton(
                    color: Colors.green,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(0.0)),
                    padding: new EdgeInsets.all(16.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          'Entrar',
                          style: new TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    onPressed: () {
                      resposta.email = _emailController.text;
                      signInWithEmail();
                    },
                  ),
                  Container(
                    height: 40,
                    alignment: Alignment.center,
                    child: FlatButton(
                      child: Text(
                        "Cadastre-se",
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      ),
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
                ])));
  }

  _builListDados(BuildContext context, List<DocumentSnapshot> snapshot) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          title: CircleAvatar(
            backgroundColor: Colors.green,
            maxRadius: 35.0,
            child: Icon(
              Icons.create,
              color: Colors.grey.shade900,
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              Text(
                'Login Efetuado! Prossiga para responder o questionário.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: const Text('Prosseguir'),
              onPressed: () {
                for (var item in snapshot) {
                  RespostaAluno recuperaResposta =
                      RespostaAluno.fromSnapshot(item);
                  if (recuperaResposta.uid == resposta.uid) {
                    if (recuperaResposta.cadastrado == true) {
                      resposta.uid = recuperaResposta.uid;
                      resposta.cadastrado = recuperaResposta.cadastrado;
                      resposta.nome = recuperaResposta.nome;
                      resposta.email = recuperaResposta.email;
                      resposta.matricula = recuperaResposta.matricula;
                      resposta.idade = recuperaResposta.idade;
                      resposta.sexo = recuperaResposta.sexo;
                      resposta.cidade = recuperaResposta.cidade;
                      resposta.tipopessoa = recuperaResposta.tipopessoa;
                      resposta.cursoSetor = recuperaResposta.cursoSetor;
                      ok = true;
                    }
                  }
                }
                if (ok == true) {
                  _pushPage(
                      context,
                      QuestionarioPage2(
                        resposta: resposta,
                      ));
                } else {
                  _pushPage(
                      context,
                      TelaInicial(
                        resposta: resposta,
                      ));
                }
              },
            ),
          ],
        );
      },
    );
  }

  _builListForm() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          title: CircleAvatar(
            backgroundColor: Colors.green,
            maxRadius: 35.0,
            child: Icon(
              Icons.accessibility,
              color: Colors.grey.shade900,
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              Text(
                'Login Efetuado! Preencha os dados e prossiga para responder o questionário.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          actions: [
            FlatButton(
                child: const Text('Prosseguir'),
                onPressed: () {
                  _pushPage(
                      context,
                      TelaInicial(
                        resposta: resposta,
                      ));
                }),
          ],
        );
      },
    );
  }

  void signInWithEmail() async {
    // marked async
    FirebaseUser user;
    try {
      user = await _auth.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      resposta.uid = user.uid;
    } catch (e) {
      return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.grey.shade900,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            title: CircleAvatar(
              backgroundColor: Colors.red,
              maxRadius: 35.0,
              child: Icon(
                Icons.warning,
                color: Colors.grey.shade900,
              ),
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 8),
                Text(
                  'Email ou senha incorretos',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('Voltar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } finally {
      if (user != null) {
        // sign in successful!
        /* StreamBuilder<QuerySnapshot>(
            stream: repository.getStream(),
            builder: (context, snapshot) {
              if(!snapshot.hasData)
              {
                return _builListForm();
              }
              else
              {
                return _builListDados(context,snapshot.data.documents);
              }
              
            }); */
        _pushPage(
            context,
            InicioQuestionarioPage(
              resposta: resposta,
            ));
      } else {
        // sign in unsuccessful
        print('Não foi possivel fazer login');
      }
    }
  }
}

void _pushPage(BuildContext context, Widget page) {
  Navigator.of(context).push(
    MaterialPageRoute<void>(builder: (_) => page),
  );
}
