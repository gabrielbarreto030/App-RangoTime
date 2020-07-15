import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rango_time_app/SplashScreen/splash-conttroler.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  double animation = 0;
  animationStart() {
    var _duration = Duration(seconds: 1);
    return new Timer(_duration, anima);
  }
  void anima() {
    setState(() {
      animation = 1;
    });
  }
  @override
  void initState() {
    super.initState();
    animationStart();
    startSplashScreenTimer(context);
  }
  @override
  void dispose(){
    super.dispose();
    this.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return  Container(
        decoration: new BoxDecoration(color: Color(0xffffca73)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("imgs/Logo.png"),
              SizedBox(
                height: 120,
              ),
              AnimatedOpacity(
                  duration: Duration(seconds: 3),
                  curve: Curves.ease,
                  opacity: animation,
                  child: Text(
                    "Satisfação no sorriso!!!",
                    style: TextStyle(
                        color: Color(0xff707070),
                        fontSize: 20,
                        decoration: TextDecoration.none),
                  ))
            ],
          ),
        ),
      
    );
  }
}
