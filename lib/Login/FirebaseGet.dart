import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rango_time_app/Login/FirebaseImplement.dart';



class LoginGet implements LoginRepository{
 CollectionReference get users=> Firestore.instance.collection('/user');
  @override
  Future<List<Map>> getUsers() async{
    // TODO: implement getUsers
       return (await users.getDocuments()).documents.map((e)=>{'nome':e.data['nome']}).toList();
  }

  @override
  Stream<List<Map>> streamEmailUsers() {
     //TODO: implement streamUsers
    
    
    return users.snapshots().map((e)=>e.documents.map((e)=>{e.data['email']:e.data['senha']}).toList());
    //return users.snapshots().map((e)=>e.documents.map((e)=>{'email':e.data['email']}).toList());
  }

  @override
  Stream<List<Map>> pegaUsuarios() {
    // TODO: implement pegaUsuarios
    return  users.snapshots().map((e)=> e.documents.map((e)=>{'user':e.data}).toList());  
  }
  
// Userbasico pegaDados(Stream<List<DocumentSnapshot>> c){
//        c.map((e){
//          var nome=e.single.data['nome'];
//          var endereco=e.single.data['endereco'];
//          var uf=e.single.data['uf'];
//          var cidade=e.single.data['cidade'];

//          final Userbasico user=Userbasico(nome,endereco,uf,cidade);

//          return user;
//        });
//}



 
}