import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rango_time_app/model/UserLogin.dart';

class Entrega extends StatefulWidget {
  @override
  _EntregaState createState() => _EntregaState();
}

class _EntregaState extends State<Entrega> with TickerProviderStateMixin {
 
  double fontStatus=15.0;
  AnimationController scalecontroller;
  Animation<double> scaleanimatie;
  double scaleinit = 1.0;
  double scaleend = 1.8;
  double moveAnimateRight = 35;
  double moveAnimateTop = 20;
  bool pedidosaiuentrega = false;
  bool pedidopronto = false;
  @override
  void initState() {
    super.initState();
    scalecontroller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    scaleanimatie = Tween(begin: scaleinit, end: scaleend).animate(
        CurvedAnimation(parent: scalecontroller, curve: Curves.easeInCirc));
    scalecontroller.repeat();
    Timer(Duration(milliseconds: 5000), () {
      setState(() {
        pedidosaiuentrega = true;
        moveAnimateTop = 100;
      });
    });
    Timer(Duration(milliseconds: 10000), () {
      setState(() {
        scalecontroller.stop();
        pedidopronto = true;
      });
    });
  }
  @override
  void dispose() {
    super.dispose();
    scalecontroller.dispose();
  }
  @override
  Widget build(BuildContext context) {
      final String refer=ModalRoute.of(context).settings.arguments;
    return Scaffold(
        backgroundColor: Color(0xff34d2af),
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Row(
                    children: <Widget>[
                      Image(
                        image: AssetImage("imgs/entrega.jpg"),
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width*0.25,
                        height: MediaQuery.of(context).size.height*0.12,
                      ),
                      Text(
                        "Seu pedido foi realizado e \n será entregue de \n 10 à 20 minutos",
                        style:
                            TextStyle(color: Color(0xffffffff), fontSize: MediaQuery.of(context).size.height*0.028),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width*0.2,
                        height: 230,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              right: 50,
                              child: Container(
                                width: 2,
                                height: 400,
                                color: Color(0xff707070),
                              ),
                            ),
                            Positioned(
                              right: 35,
                              top: 20,
                              child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xff707070)),
                                      color: Color(0xff707070),
                                      shape: BoxShape.circle)),
                            ),
                               Positioned(                                 
                              right: moveAnimateRight,
                              top: moveAnimateTop,
                              child: ScaleTransition(                                
                                scale: scaleanimatie,
                                child: pedidopronto?Container() :Container(                                  
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: Color(0xff707070)),
                                        shape: BoxShape.circle)),
                              ),
                            ),
                            Positioned(
                              right: 35,
                              top: 100,
                              child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xff707070)),
                                      color: pedidosaiuentrega
                                          ? Color(0xff707070)
                                          : Color(0xffffffff),
                                      shape: BoxShape.circle)),
                            ),
                            Positioned(
                              right: 35,
                              top: 180,
                              child: pedidopronto
                                  ? Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xff707070)),
                                          color: Color(0xff707070),
                                          shape: BoxShape.circle),
                                      child: Icon(
                                        Icons.check,
                                        color: Color(0xffffffff),
                                      ),
                                    )
                                  : Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xff707070)),
                                          color: Color(0xffffffff),
                                          shape: BoxShape.circle)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.6,
                        height: 180,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Seu pedido está sendo preparado",
                                style: TextStyle(
                                    color: Colors.white, fontSize: fontStatus)),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Text("Seu pedido saiu para entrega",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: fontStatus)),
                            ),
                            Text("Seu pedido chegou!!",
                                style: TextStyle(
                                    color: Colors.white, fontSize: fontStatus)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                  child: Text(
                    "Muito obrigado pelo pedido!!!",
                    style: TextStyle(color: Color(0xffffffff), fontSize: 24),
                  ),
                ),
                GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB (0,0,0,50),
                      child: Image(image: AssetImage("imgs/rostopiscando.png")),
                    )),
                    
              ],
            ),
            Positioned(
              bottom: 0,
              right: MediaQuery.of(context).size.width*0.03,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                    side: BorderSide(color: Color(0xff707070))),
                padding: EdgeInsets.fromLTRB(50, 10, 50, 0),
                color: Color(0xff5e48d8),
                child: Container(
                  height: 50,
                  width: 240,
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Align(
                    alignment: Alignment(0, 0.6),
                    child: Text(
                      "Voltar ao inicio",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).popAndPushNamed("/Home",arguments: LoginUser(refer));
                },
              ),
            ),
          ],
        ));
  }
}
