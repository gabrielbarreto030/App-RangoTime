import 'package:flutter/material.dart';
import 'package:rango_time_app/Login/Login-controller.dart';
import 'package:rango_time_app/model/UserLogin.dart';
import 'package:rango_time_app/model/UserReferProduct.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    
    Size tela=MediaQuery.of(context).size;
    final LoginUser args = ModalRoute.of(context).settings.arguments;   
     return Scaffold(
      backgroundColor: Color(0xff34d2af),
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Color(0xff707070), width: 1))),
                            child: Text(
                              "Salgado",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 20),
                            )),
                      )
                    ],
                  ),
                  Container(
                    width: 400,
                    height: 850,
                    child: GridView.count(
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      // crossAxisSpacing: 50,
                      childAspectRatio: 0.8,
                      crossAxisCount: 2,
                      children: <Widget>[
                        itemstore("imgs/coxinha.png", "Coxinha", "0.99", 1,args.nome),
                        itemstore("imgs/kibe.png", "Kibe", "0.99", 2,args.nome),
                        itemstore(
                            "imgs/bolinho.png", "Bolinho de queijo", "0.99", 3,args.nome),
                        itemstore("imgs/bolinho_salsicha.png",
                            "Bolinho de Salsicha", "1.99", 4,args.nome),
                        itemstore("imgs/esfirra-1.png", "Esfirra", "1.99", 5,args.nome),
                        itemstore("imgs/fogassa.png", "Fogassa", "1.49", 6,args.nome),
                      
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width * 1.2,
              height: 85,
              color: Color(0xffffca73),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/Produto",arguments: UserReferProduct(args.nome,id:1));
                        },
                        child: Icon(Icons.shopping_cart)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 150, 0),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/Perfil",arguments: args);
                        },
                        child: Icon(Icons.account_circle)),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,          
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: Image.asset(
                                "imgs/Logo-1.png",
                                scale: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),
          ),
        ],
      ),
    );
  }

  GestureDetector itemstore(String caminho, String nome, String valor, int n,String email) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/Produto', arguments: UserReferProduct(email,id:n));
      },
      child: Card(
       
        child: Container(
          color: Color(0xff34d2af),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                color: Colors.white,
                width: 150,
              ),
              Positioned(bottom: MediaQuery.of(context).size.height*0.05, left: MediaQuery.of(context).size.width*0.04, child: Text(nome)),
              Positioned(bottom: 5, left: 95, child: Text("R\$ " + valor)),
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Image(
                        width: 120,
                        fit: BoxFit.fitWidth,
                        image: AssetImage(caminho),
                      ),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
