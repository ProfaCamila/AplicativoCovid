import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:questcovid/login/login.dart';
import 'package:questcovid/main.dart';
import 'package:questcovid/repository/resposta_repository.dart';
import 'package:questcovid/main.dart';
import 'package:questcovid/screens_form/tela_inicial.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

//stf create a StatefulWidget name RegisterPage

class RegisterPage extends StatefulWidget {
  final String title = 'Registration';

  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passswordController = TextEditingController();
  final RespostaRepository repository = RespostaRepository();

  bool _success;
  String _userEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Registre-se no QuestCovid"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Container(
              width: 270,
              height: 270,
              alignment: Alignment(0.0, 1.15),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: AssetImage("assets/icone.jpeg"),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            TextFormField(
              controller: _emailController,
              decoration:
                  InputDecoration(labelText: 'Email', icon: Icon(Icons.email)),
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Por favor digite o email';
                }
              },
            ),
            TextFormField(
              controller: _passswordController,
              decoration: InputDecoration(
                  labelText: 'Senha', icon: Icon(Icons.vpn_key)),
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Por favor, digite a senha';
                }
              },
            ),
            Container(
              width: 20,
              height: 25,
              alignment: Alignment.centerLeft,
              child: Text(
                'Senha deve conter mais que 6 dígitos',
                style: TextStyle(fontSize: 18),
              ),
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
                    'Registrar',
                    style: new TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ],
              ),
              onPressed: () {
                _register();
              },
            ),
            Container(
              alignment: Alignment.center,
              child: Text(_success == null
                  ? ''
                  : (_success
                      ? 'Successfully registered' + _userEmail
                      : 'Registration failed')),
            ),
            Container(
              width: 150,
              height: 150,
              alignment: Alignment.center,
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

  void dispose() {
    _emailController.dispose();
    _passswordController.dispose();
    super.dispose();
  }

  void _register() async {
    final FirebaseUser user = await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passswordController.text,
    );

    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });

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
                  "Registrado com sucesso",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
            actions: [
              FlatButton(
                child: const Text('OK'),
                onPressed: () {
                  resposta.uid = user.uid;
                  resposta.email = user.email;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TelaInicial(
                                resposta: resposta,
                              )));
                },
              ),
            ],
          );
        },
      );
    } else {
      _success = false;
    }
  }
}
