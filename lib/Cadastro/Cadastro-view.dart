import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rango_time_app/Cadastro/Cadastro-controller.dart';
import 'package:rango_time_app/model/Background-Curve.dart';
import 'package:rango_time_app/model/Database.dart';
import 'package:rango_time_app/model/Usuario.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro>
    with SingleTickerProviderStateMixin {
  final db = Firestore.instance;
  AnimationController _controller;
  String id;
  String nome;
  String email;
  String bairro;
  String n;
  String endereco;
  String uf;
  String cidade;
  String senha;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff34d2af),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            backgroundCurve(context),
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Form(
                  key: keyForm,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
                        child: TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(45)
                          ],
                          onChanged: ((value) {
                            nome = value;
                          }),
                          validator: ((value) {
                            if (value.isEmpty || value.length < 6) {
                              return "Insira seu nome completo";
                            }
                            if (value.contains(new RegExp(r"[0-9]"))) {
                              return "Insira um nome valido";
                            }
                            return null;
                          }),
                          decoration:
                              InputDecoration(labelText: "Nome Completo"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
                        child: TextFormField(
                          onChanged: ((value) {
                            email = value;
                          }),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(30)
                          ],
                          validator: ((value) {
                            if (value.isEmpty) {
                              return "Insira seu Email";
                            }
                            if (!value.contains("@")) {
                              return "Email invalido";
                            }
                            return null;
                          }),
                          decoration: InputDecoration(labelText: "Email"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
                        child: Row(
                          children: <Widget>[
                            Flexible(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  onChanged: ((value) {
                                    n = value;
                                  }),
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(4)
                                  ],
                                  validator: ((value) {
                                    if (value.isEmpty) {
                                      return "Insira seu nº";
                                    }

                                    return null;
                                  }),
                                  decoration: InputDecoration(labelText: "Nº"),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: TextFormField(
                                onChanged: ((value) {
                                  bairro = value;
                                }),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(40)
                                ],
                                validator: ((value) {
                                  if (value.isEmpty || value.length < 2) {
                                    return "Insira seu Bairro";
                                  }
                                  if (value.contains(new RegExp(r"[0-9]"))) {
                                    return "Insira um Bairro válido";
                                  }

                                  return null;
                                }),
                                decoration:
                                    InputDecoration(labelText: "Bairro"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
                        child: TextFormField(
                          onChanged: ((value) {
                            endereco = value;
                          }),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(40)
                          ],
                          validator: ((value) {
                            if (value.isEmpty || value.length < 3) {
                              return "Insira seu endereco";
                            }
                            return null;
                          }),
                          decoration: InputDecoration(labelText: "Endereço"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
                        child: Row(
                          children: <Widget>[
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
                                child: TextFormField(
                                  onChanged: ((value) {
                                    uf = value;
                                  }),
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(2)
                                  ],
                                  validator: ((value) {
                                    if (value.isEmpty || value.length < 2) {
                                      return "Insira seu estado";
                                    }

                                    return null;
                                  }),
                                  decoration: InputDecoration(labelText: "UF"),
                                ),
                              ),
                            ),
                            Flexible(
                              child: TextFormField(
                                onChanged: ((value) {
                                  cidade = value;
                                }),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(40)
                                ],
                                validator: ((value) {
                                  if (value.isEmpty || value.length < 2) {
                                    return "Insira sua cidade";
                                  }
                                  if (value.contains(new RegExp(r"[0-9]"))) {
                                    return "Insira uma cidade válida";
                                  }
                                  return null;
                                }),
                                decoration:
                                    InputDecoration(labelText: "Cidade"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
                        child: TextFormField(
                          onChanged: ((value) {
                            senha = value;
                          }),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(16)
                          ],
                          obscureText: true,
                          validator: ((value) {
                            if (value.isEmpty || value.length < 4) {
                              return "Insira uma senha de 4 caracteres";
                            }

                            return null;
                          }),
                          decoration: InputDecoration(labelText: "Senha"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                                value: checkTerms,
                                onChanged: (e) {
                                  setState(() {
                                    checkTerms = e;
                                  });
                                }),
                            Text(
                              "Eu li e Aceito os Termos da empresa",
                              style: TextStyle(color: colorTerms),
                            )
                          ],
                        ),
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                        color: Color(0xff5e48d8),
                        child: Text(
                          "Cadastrar",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        onPressed: () async {
                          if (keyForm.currentState.validate()) {
                            print("Tudo certo");

                            if (checkTerms = true) {
                              print(endereco);

                              DocumentReference ref =
                                  await db.collection('/user').add({
                                'nome': nome.trim(),
                                'email': email.trim(),
                                'endereco': endereco.trim(),
                                'n': n.trim(),
                                'bairro': bairro.trim(),
                                'uf': uf.trim(),
                                'cidade': cidade.trim(),
                                'senha': senha.trim()
                              });
                              setState(() => id = ref.documentID);
                              print(ref.documentID);
                              Navigator.popAndPushNamed(context, '/Login');

                              //db.Registra(Usuario("$email","$senha","$endereco","$uf","$cidade","$nome",bairro: "$bairro",n: "$n"));
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
