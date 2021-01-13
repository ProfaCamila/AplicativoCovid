import 'package:cloud_firestore/cloud_firestore.dart';

class RespostaAluno{
  String veracidade;
  String uid;
  bool cadastrado;
  String nome;
  String email;
  String matricula;
  String cursoSetor;
  String idade;
  String sexo;
  String cidade;
  String tipopessoa;
  String questaoinicial;
  String questao3; //diagnostico
  String questao4; //contatogeral
  String questao7; //isolamento 
  String questao8; //máscara
  List<String> sintomas = new List<String>();
  List<String> comorbidades=new List<String>();

  DocumentReference reference;
  
    RespostaAluno(this.veracidade,this.uid,this.cadastrado,this.tipopessoa,this.nome, this.email,this.matricula,this.cursoSetor,this.idade,this.sexo,this.cidade,this.questao3,this.questao4,this.questao7,this.questao8,this.sintomas,this.comorbidades);
   
    factory RespostaAluno.fromSnapshot(DocumentSnapshot snapshot){
      RespostaAluno novaResposta = RespostaAluno.fromJson(snapshot.data);
      novaResposta.reference=snapshot.reference;  
      return novaResposta;
    }
  
  
     factory RespostaAluno.fromJson(Map<dynamic, dynamic> json) => _RespostaFromJson(json);
  
    Map<String, dynamic> toJson() => _RespostaToJson(this);
  
  }

RespostaAluno _RespostaFromJson(Map<dynamic, dynamic> json) {
  return RespostaAluno(
    json['Comprometimento'] as String,
    json['UID'] as String,
    json['Cadastrado'] as bool,
    json['TipoPessoa'] as String,
    json['Nome'] as String,
    json['Email'] as String,
    json['Matricula'] as String,
    json['CursoSetor'] as String,
    json['Idade'] as String,
    json['Sexo'] as String,
    json['Cidade'] as String,
    json['DiagnosticoConfirmado'] as String,
    json['ContatoGeral'] as String,
    json['Isolamento'] as String,
    json['UsoMascara'] as String,
    json['Sintomas'] as List,
    json['Comorbidades'] as List
    );
}

Map<String, dynamic> _RespostaToJson(RespostaAluno instance) =>
    <String, dynamic>{
      'Comprometimento': instance.veracidade,
      'UID': instance.uid,
      'Cadastrado': instance.cadastrado,
      'TipoPessoa': instance.tipopessoa,
      'Nome': instance.nome,
      'Email': instance.email,
      'Matricula': instance.matricula,
      'CursoSetor': instance.cursoSetor,
      'Idade':instance.idade,
      'Sexo':instance.sexo,
      'Cidade':instance.cidade,
      'DiagnosticoConfirmado':instance.questao3,
      'ContatoGeral': instance.questao4,
      'Isolamento':instance.questao7,
      'UsoMascara': instance.questao8,
      'Sintomas':instance.sintomas,
      'Comorbidades':instance.comorbidades,

    };



   

