import 'package:questcovid/model/respostas_aluno.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class RespostaRepository{
  CollectionReference collection = Firestore.instance.collection('respostasCovid');
  
    Stream<QuerySnapshot> getStream(){
      return collection.snapshots();
    }
  
    Future<DocumentReference> addResposta(RespostaAluno respostaAluno){
      return collection.add(respostaAluno.toJson());
    }
  
  updateResposta(RespostaAluno respostaAluno) async {
    await collection.document(respostaAluno.reference.documentID).updateData(respostaAluno.toJson());
  }
  removeResposta(RespostaAluno respostaAluno) async{
     await collection.document(respostaAluno.reference.documentID).delete();
  }
  
  }