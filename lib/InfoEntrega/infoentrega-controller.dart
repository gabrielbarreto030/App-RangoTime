import 'package:flutter/material.dart';

Container titleInfo(BuildContext context,String title ) {
    return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(width: 2, color: Color(0xff000000)),
                  )),
                  child: Text(
                    "$title",
                    style:
                        TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ));
  }

Container lineProduct(String quant, String salgado, String preco) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
            width: 250,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: Color(0xff707070)))),
            child: Text(
              "$quant x $salgado",
              style: TextStyle(fontSize: 18, letterSpacing: 1),
            )),
        Container(
            width: 60,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: Color(0xff707070)))),
            child: Text(
              "$preco",
              style: TextStyle(fontSize: 18, letterSpacing: 1),
            ))
      ],
    ));
  }