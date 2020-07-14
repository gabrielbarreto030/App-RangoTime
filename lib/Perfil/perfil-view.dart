import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:rango_time_app/model/UserLogin.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  String nome;
  String email;
  String endereco;
  String n;
  String bairro;
  String cidade;
  String uf;
  bool dadoEdit = false;
  @override
  Widget build(BuildContext context) {
    var tela=MediaQuery.of(context).size;
    final LoginUser args = ModalRoute.of(context).settings.arguments;
    var snapshots = Firestore.instance
        .collection('user')
        .where('email', isEqualTo: args.nome.trim())
        .snapshots();

    return Scaffold(
      backgroundColor: Color(0xff34d2af),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(height: MediaQuery.of(context).size.height),
            Positioned(
              bottom: 0,
              right: MediaQuery.of(context).size.width*0.05,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                    side: BorderSide(color: Color(0xff707070),width: 2)),
                padding: EdgeInsets.fromLTRB(40, 10, 40, 0),
                color: Color(0xff5e48d8),
                child: Container(
                  height: 50,
                  width: 240,
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Align(
                    alignment: Alignment(0, 0.4),
                    child: Text(
                      "Voltar ao inicio",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/Home', arguments: args);
                },
              ),
            ),
            StreamBuilder(
                stream: snapshots,
                builder: (context, snapshot) {
                  var item = snapshot.data.documents[0];
                  item['nome'] != null ? nome = item['nome'] : nome = "nome";
                  item['email'] != null
                      ? email = item['email']
                      : email = "email";
                  item['endereco'] != null
                      ? endereco = item['endereco']
                      : endereco = "endereco";
                  item['n'] != null ? n = item['n'] : n = 'n';
                  item['bairro'] != null
                      ? bairro = item['bairro']
                      : bairro = 'bairro';
                  item['cidade'] != null
                      ? cidade = item['cidade']
                      : cidade = 'cidade';
                  item['uf'] != null ? uf = item['uf'] : uf = "uf";
                  return Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 30, 0),
                                    child: Image(
                                        image: AssetImage("imgs/perfil.png")),
                                  ),
                                  Flexible(
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          width: 200,
                                          height: 80,
                                          child: TextField(
                                            onChanged: (e) {
                                              nome = e;
                                            },
                                            enabled: dadoEdit,
                                            decoration: InputDecoration(
                                                hintText: "${item['nome']}",
                                                hintStyle: TextStyle(
                                                    color: Colors.white)),
                                          ),
                                        ),
                                        Container(
                                          width: 200,
                                          child: TextField(
                                            enabled: dadoEdit,
                                            onChanged: (e) {
                                              email = e;
                                            },
                                            decoration: InputDecoration(
                                                hintText: "${item['email']}",
                                                hintStyle: TextStyle(
                                                    color: Colors.white)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //-------------------------------------------
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 40),
                          Row(
                            children: <Widget>[
                              Text(
                                "Endereço",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                flex: 8,
                                child: TextField(
                                  enabled: dadoEdit,
                                  onChanged: (e) {
                                    endereco = e;
                                  },
                                  decoration: InputDecoration(
                                      hintText: "${item['endereco']}",
                                      hintStyle:
                                          TextStyle(color: Colors.white)),
                                ),
                              ),
                              SizedBox(width: 40),
                              Flexible(
                                flex: 2,
                                child: TextField(
                                  enabled: dadoEdit,
                                  onChanged: (e) {
                                    n = e;
                                  },
                                  decoration: InputDecoration(
                                      hintText:
                                          n != null ? "${item['n']}" : "n",
                                      hintStyle:
                                          TextStyle(color: Colors.white)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 50),
                          Row(
                            children: <Widget>[
                              Flexible(
                                flex: 4,
                                child: TextField(
                                  onChanged: (e) {
                                    bairro = e;
                                  },
                                  enabled: dadoEdit,
                                  decoration: InputDecoration(
                                      hintText: bairro != null
                                          ? "${item['bairro']}"
                                          : "bairro",
                                      hintStyle:
                                          TextStyle(color: Colors.white)),
                                ),
                              ),
                              SizedBox(width: 40),
                              Flexible(
                                flex: 6,
                                child: TextField(
                                  onChanged: (e) {
                                    cidade = e;
                                  },
                                  enabled: dadoEdit,
                                  decoration: InputDecoration(
                                      hintText: "${item['cidade']}",
                                      hintStyle:
                                          TextStyle(color: Colors.white)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          Row(
                            children: <Widget>[
                              Flexible(
                                child: Container(
                                  width: 60,
                                  child: TextField(
                                    onChanged: (e) {
                                      uf = e;
                                    },
                                    enabled: dadoEdit,
                                    decoration: InputDecoration(
                                        hintText: "${item['uf']}",
                                        hintStyle:
                                            TextStyle(color: Colors.white)),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 40),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RaisedButton(
                                  color: dadoEdit?Color(0xff707070):Color(0xff1f7867),
                                  onPressed: () {
                                    setState(() {
                                      dadoEdit = true;
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Color(0xff707070)),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    child: Text(
                                      "Editar",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                  ),
                                ),
                                SizedBox(width:MediaQuery.of(context).size.width*0.04),
                                RaisedButton(
                                  color: dadoEdit?Color(0xff1f7867):Color(0xff707070),
                                  onPressed: () {
                                    Firestore.instance
                                        .runTransaction((transaction) async {
                                      DocumentSnapshot doc =
                                          await transaction.get(item.reference);
                                      await transaction.update(doc.reference, {
                                        'nome': nome,
                                        'email': email,
                                        'endereco': endereco,
                                        'n': n != null ? n : "n",
                                        'bairro':
                                            bairro != null ? bairro : "bairro",
                                        'cidade': cidade,
                                        'uf': uf
                                      });
                                    });
                                    
                                  },
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Color(0xff707070)),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    child: Text(
                                      "Alterar",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                           SizedBox(height:50),
                        ],
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
