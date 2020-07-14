import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rango_time_app/InfoEntrega/infoentrega-controller.dart';
import 'package:rango_time_app/Produto/Produto-controller.dart';
import 'package:rango_time_app/model/Background-Curve.dart';
import 'package:rango_time_app/model/CartAndUser.dart';

class InfoEntrega extends StatefulWidget {
  @override
  _InfoEntregaState createState() => _InfoEntregaState();
}
String obs="";
bool addressconfirm=false;
bool scheduleorder=false;
bool withdraworder=false;
class _InfoEntregaState extends State<InfoEntrega> {
 
  bool check = false;
  @override
  Widget build(BuildContext context) {
    final CartAndUser refer=ModalRoute.of(context).settings.arguments;
    final CartproductsTotal carrinho=refer.cart;

    var snapshots=Firestore.instance.collection('user').where('email',isEqualTo: refer.email.trim()).snapshots();



    
    return Scaffold(
      backgroundColor: Color(0xff34d2af),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            backgroundCurve(context),
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                children: <Widget>[
                  titleInfo(context, "Pedido"),
                  SingleChildScrollView(
                                      child: Container(
                      width: 400,
                      height: 90,
                      child: ListView.builder(
                        itemCount: carrinho.produtos.length,
                        itemBuilder: (context,i){
                          final String q=carrinho.produtos[i].quantidade.toString();
                          final String n=carrinho.produtos[i].nome.toString();
                          final String v=carrinho.produtos[i].totalProduto().toString();                         
                          return lineProduct("$q", "$n", "$v");
                      // lineProduct("10", "Esfirra", "15,00"),
                      // lineProduct("20", "Bolinho de Queijo", "20,00"),

                      })
                    ),
                  ),
                 
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                          child: Text(
                        "Total R\$",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                      Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1, color: Color(0xff707070)))),
                          width: 60,
                          child: Text(
                            "${carrinho.total}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 100,
                        color: Colors.white,
                        child: TextField(
                          onChanged: (text){
                                obs=text;
                          },
                          maxLines: 5,
                          style:
                              TextStyle(fontSize: 20, color: Color(0xff000000)),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Alguma observação(Ex:com pouco sal)",
                          ),
                        )),
                  ),
                  //------------------------------------------------
                  StreamBuilder(
                    stream: snapshots,
                    builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
                      var dados= snapshot.data.documents[0];
                      return Column(children: <Widget>[
                        titleInfo(context, "Local de Entrega"),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              child: Flexible(
                            flex: 5,
                            child: TextField(
                              decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colors.white),
                                hintText: "${dados['endereco']}",
                              ),
                            ),
                          )),
                          SizedBox(
                            width: 60,
                          ),
                          Container(
                              child: Flexible(
                            flex: 1,
                            child: TextField(
                              decoration: InputDecoration(
                                  hintStyle: TextStyle(color: Colors.white),
                                  hintText: "${dados['n']}"),
                            ),
                          )),
                          SizedBox(
                            width: 50,
                          )
                        ],
                      ),
                      SizedBox(height: 40),
                      Row(
                        children: <Widget>[
                          Container(
                              child: Flexible(
                            flex: 2,
                            child: TextField(
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(color: Colors.white),
                                    hintText: "${dados['bairro']}")),
                          )),
                          SizedBox(width: 60),
                          Container(
                              child: Flexible(
                            flex: 2,
                            child: TextField(
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(color: Colors.white),
                                    hintText: "${dados['cidade']}")),
                          )),
                          SizedBox(width: 80),
                          Container(
                              child: Flexible(
                            flex: 1,
                            child: TextField(
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(color: Colors.white),
                                    hintText: "${dados['uf']}")),
                          )),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Checkbox(
                              value: addressconfirm,
                              onChanged: (v) {
                                setState(() {
                                  addressconfirm=v;
                                });
                              },
                            ),
                            Text(
                              "Confirmar Endereço",
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            )
                          ],
                        ),
                      ),


                      ],);
                    }
                  ),
                  
                  //----------------------------------------
                  titleInfo(context, "Opções Adicionais"),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Checkbox(
                          value: withdraworder,
                          onChanged: (v) {
                            setState(() {
                              withdraworder=v;
                              scheduleorder=false;

                            });
                          },
                        ),
                        Text(
                          "Buscar pedido na lanchonete",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Checkbox(
                          value: scheduleorder,
                          onChanged: (v) {
                            setState(() {
                              scheduleorder=v;
                              withdraworder=false;

                            });
                          },
                        ),
                        Text(
                          "Agendar pedido",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  //-----------------------------------------------------
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                       side:BorderSide(color:Color(0xff707070))
                    ),
                    padding: EdgeInsets.fromLTRB(50, 10, 50, 0),
                    color: Color(0xff5e48d8),
                    child: Container(
                      height: 50,
                      width: 240,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Align(
                        alignment: Alignment(0,0.6),
                        child: Text(
                          "Continuar",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if(addressconfirm){
                        Navigator.pushNamed(context, "/Entrega",arguments: refer.email);
                      }
                      if(withdraworder && addressconfirm){
                        Navigator.pushNamed(context, "/Retirar",arguments: refer.email);
                      }
                      if(scheduleorder){
                        Navigator.pushNamed(context,"/Agendar",arguments: refer.email);
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
