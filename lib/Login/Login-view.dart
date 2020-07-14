import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rango_time_app/Home/Home-view.dart';
import 'package:rango_time_app/Login/FirebaseGet.dart';
import 'package:rango_time_app/Login/Login-controller.dart';
import 'package:rango_time_app/model/Database.dart';
import 'package:rango_time_app/model/UserLogin.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Userbasico userbasico;
  LoginGet userslist = LoginGet();
  String msgErro;
  double erroOpacity = 0;
  final formKey = GlobalKey<FormState>();
  final keyAnimateError = GlobalKey<AnimatedWidgetBaseState>();

  /*Variaveis que necessitam trocar seu Estado
 msgErro
 erroOpacity
 
  */
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String emailtext;
    String senhaltext;
    String cidade = "";
    print('$cidade');
    return Scaffold(
      backgroundColor: Color(0xffffca73),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 20),
                  Image.asset("imgs/Logo.png"),
                  SizedBox(
                    height: 30,
                  ),
                  AnimatedOpacity(
                    key: keyAnimateError,
                    opacity: erroOpacity,
                    duration: Duration(milliseconds: 50),
                    child: Container(
                      width: 200,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Color(0xff1f7b67),
                          border: Border.all(color: Color(0xff707070)),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          "${msgErro}",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                          child: TextFormField(
                              keyboardType:TextInputType.emailAddress ,
                              validator: ((value) {
                                if (value.isEmpty) {
                                  return "Insira seu Email";
                                }
                                if (!value.contains("@")) {
                                  return "Email invalido";
                                }
                                return null;
                              }),
                              onChanged: (text) {
                                emailtext = "$text ";
                              },
                              style: TextStyle(
                                  fontSize: 25, color: Color(0xff000000)),
                              decoration: InputDecoration(labelText: "Email")),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                          child: TextFormField(
                            validator: ((value) {
                              if (value.isEmpty) {
                                return "Insira sua Senha";
                              }
                              if (value.length < 4) {
                                return "Senha invalida";
                              }
                              return null;
                            }),
                            obscureText: true,
                            onChanged: (text) {
                              senhaltext = text;
                            },
                            style: TextStyle(
                                fontSize: 25, color: Color(0xff000000)),
                            decoration: InputDecoration(labelText: "Senha"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  StreamBuilder(
                      stream: userslist.pegaUsuarios(),
                      builder: (context, snapshot) {
                        final list = snapshot.data;
                        return RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                          color: Color(0xff5e48d8),
                          child: Text(
                            "Entrar",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          onPressed: () {
                            if (formKey.currentState.validate()) {
                              userslist.streamEmailUsers().forEach((e) {
                                for (Map<dynamic, dynamic> i in e) {
                                  String emailServ = (i.keys.toString());
                                  String emailform = emailServ.replaceAll(
                                      new RegExp('[{()}]'), '');
                                  String senhaServ = (i.values.toString());
                                  String senhaform = senhaServ.replaceAll(
                                      new RegExp('[{()}]'), '');
                                  if (emailform.trim().toString() ==
                                      emailtext.trim().toString()) {
                                    if (senhaform.trim().toString() ==
                                        senhaltext.trim().toString()) {
                                      Navigator.pushNamed(context, '/Home',
                                          arguments: LoginUser(emailtext));
                                    }
                                  }
                                }
                              });
                            } else {
                              setState(() {
                                erroOpacity = 1;
                                msgErro = "Dados invalidos";
                              });
                            }
                          },
                        );
                      }),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Não tem conta?",
                        style:
                            TextStyle(fontSize: 25, color: Color(0xff707070)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/Cadastro");
                        },
                        child: Text("Criar conta",
                            style: TextStyle(
                                fontSize: 25,
                                color: Color(0xff1F7B67),
                                decoration: TextDecoration.underline)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
