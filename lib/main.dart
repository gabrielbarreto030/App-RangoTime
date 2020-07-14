import 'package:flutter/material.dart';
import 'package:rango_time_app/Agendar/Agendar.-view.dart';
import 'package:rango_time_app/Cadastro/Cadastro-view.dart';
import 'package:rango_time_app/Entrega/entrega-view.dart';
import 'package:rango_time_app/Home/Home-view.dart';
import 'package:rango_time_app/InfoEntrega/infoentrega-view.dart';
import 'package:rango_time_app/Perfil/perfil-view.dart';
import 'package:rango_time_app/Produto/Produto-view.dart';
import 'package:rango_time_app/Retirada/Retirada-view.dart';
import 'package:rango_time_app/SplashScreen/splash-view.dart';
import 'Login/Login-view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(       
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/Splash",
      routes: <String, WidgetBuilder>{
        "/Splash": (BuildContext context) => SplashPage(),
        "/Login": (BuildContext context) => Login(),
        "/Cadastro": (BuildContext context) => Cadastro(),
        "/Home": (BuildContext context) => Home(),
        "/Perfil": (BuildContext context) => Perfil(),
        "/Produto": (BuildContext context) => Produto(),
        "/InfoEntrega": (BuildContext context) => InfoEntrega(),
        "/Entrega": (BuildContext context) => Entrega(),
        "/Agendar": (BuildContext context) => Agendar(),
        "/Retirar": (BuildContext context) => Retirada()
      },
    );
  }
}

