import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rango_time_app/model/Background-Curve.dart';
import 'package:rango_time_app/model/UserLogin.dart';

class Retirada extends StatefulWidget {
  @override
  _RetiradaState createState() => _RetiradaState();
}

class _RetiradaState extends State<Retirada> with TickerProviderStateMixin {
  double scaleinit = 1.0;
  double scaleinit2 = 0.3;
  double scaleend = 3.0;
  double scaleend2 = 1.0;
  AnimationController scaleController;
  AnimationController scaleController2;
  Animation<double> scaleAnimation;
  Animation<double> scaleAnimation2;
  double textOpacity = 1;
  double textOpacityFinished = 0;
  bool pedidoPronto = false;
  void initState() {
    super.initState();
    scaleController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    scaleAnimation = Tween(begin: scaleinit, end: scaleend).animate(
        CurvedAnimation(parent: scaleController, curve: Curves.easeIn));
    scaleController2 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    scaleAnimation2 = Tween(begin: scaleinit2, end: scaleend2).animate(
        CurvedAnimation(parent: scaleController2, curve: Curves.easeIn));
    scaleController.repeat();
    Timer(Duration(seconds: 5), () {
      setState(() {
        textOpacity = 0;
        textOpacityFinished=1;
        pedidoPronto = true;
        scaleController.stop();
        scaleController2.forward();
      });
    });
  }

  void dispose() {
    super.dispose();
    scaleController.dispose();
    scaleController2.dispose();
  }

  @override
  Widget build(BuildContext context) {
     final String refer=ModalRoute.of(context).settings.arguments;
    return Scaffold(
        backgroundColor: Color(0xff34d2af),
        body: Stack(
          children: <Widget>[
            backgroundCurve(context),
            Column(
              children: <Widget>[
                SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width*0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5,0,0,0),
                            child: Text(
                              "Preparando",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                            child: Text(
                              "Pronto",
                              style: TextStyle(fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                  child: Container(
                      width: MediaQuery.of(context).size.width*0.9,
                      height: 140,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: 370,
                            height: 65,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: pedidoPronto?Color(0xff707070):Colors.white, width: 2))),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: 120,
                                height: 120,
                                child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      child: Container(
                                        width: 120,
                                        height: 120,
                                        child:
                                            SizedBox(width: 120, height: 120),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color(0xff707070)),
                                            color: pedidoPronto
                                                ? Color(0xff707070)
                                                : Color(0xffffffff),
                                            shape: BoxShape.circle),
                                      ),
                                    ),
                                    ScaleTransition(
                                      scale: scaleAnimation,
                                      child: Center(
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          child:
                                              SizedBox(width: 120, height: 120),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color(0xff707070)),
                                              color: Color(0xff707070),
                                              shape: BoxShape.circle),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      child: Container(
                                          width: 120,
                                          height: 120,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color(0xff707070)),
                                              shape: BoxShape.circle),
                                          child: Image(
                                            fit: BoxFit.fitWidth,
                                            image:
                                                AssetImage("imgs/chefTR.png"),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 120,
                                height: 120,
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      width: 120,
                                      height: 120,
                                      child: SizedBox(width: 120, height: 120),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xff707070)),
                                          color: Color(0xffffffff),
                                          shape: BoxShape.circle),
                                    ),
                                    ScaleTransition(
                                      scale: scaleAnimation2,
                                      child: Container(
                                        width: 120,
                                        height: 120,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color(0xff707070)),
                                            color: Color(0xff707070),
                                            shape: BoxShape.circle),
                                      ),
                                    ),
                                    Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape:BoxShape.circle,
                                          
                                        ),                                        
                                        width: 120,
                                        height: 120,
                                        child: Image(
                                          fit: BoxFit.fitHeight,
                                          image:
                                              AssetImage("imgs/prontaFood.png"),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
                Container(
                    child: Stack(
                  children: <Widget>[
                    AnimatedOpacity(
                      curve: Curves.easeIn,
                      opacity: textOpacity,
                      duration: Duration(milliseconds: 500),
                      child: Container(
                        width: 250,
                        child: Text(
                          "Seu pedido está \n sendo \n preparado!",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      curve: Curves.easeIn,
                      opacity: textOpacityFinished,
                      duration: Duration(milliseconds: 1500),
                      child: Container(
                        width: 250,
                        child: Text(
                          "Seu pedido está \n pronto para \n retirada!!!",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                    ),
                  ],
                )),
                SizedBox(height: 40),
                Container(
                    width: 120,
                    height: 120,
                    child: Image(
                      fit: BoxFit.fitWidth,
                      image: AssetImage("imgs/retirada.png"),
                    )),
              ],
            ),
            Positioned(
              bottom: 0,
              right: MediaQuery.of(context).size.width*0.07,
              child: Container(
                width: MediaQuery.of(context).size.width*0.85,
                child: RaisedButton(                
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                      side: BorderSide(color: Color(0xff707070))),
                  padding: EdgeInsets.fromLTRB(50, 10, 50, 0),
                  color: Color(0xff5e48d8),
                  child: Container(
                    height: 50,                    
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Align(
                      alignment: Alignment(0, 0.2),
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
            ),
          ],
        ));
  }
}
