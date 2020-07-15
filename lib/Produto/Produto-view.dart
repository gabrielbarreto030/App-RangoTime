import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rango_time_app/model/CartAndUser.dart';
import 'package:rango_time_app/model/Salgado.dart';
import 'package:rango_time_app/model/UserReferProduct.dart';
import 'package:rango_time_app/model/mobx/Produto.dart';
import 'Produto-controller.dart';

class Produto extends StatefulWidget {
  @override
  _ProdutoState createState() => _ProdutoState();
}

class _ProdutoState extends State<Produto> {
  ScrollController scroll = ScrollController();
  ProdutoStore productState = ProdutoStore();
  @override
  void initState() {
    super.initState();
    salgados.add(1);
    salgados.add(2);
    salgados.add(3);
    salgados.add(4);
    salgados.add(5);
    salgados.add(6);
    print(salgados);
  }

  List<Cartproduct> cartFinal = new List();
  List<Container> cart = List();
  List<int> salgados = new List(); //Lista de salgados
  CarouselSlider carousel;
  CarouselController buttonCarouselController = CarouselController();
  int idProduct = 0;
  int quant = 0; //Variavel inicial para quantidade de produtos
  int pagAtual = 1;
  int clicks = 0;
  int state = 0;
  double total = 0.00;

  @override
  Widget build(BuildContext context) {
    if (cart.length > 0) {
      productState.statebutton = true;
    } else {
      productState.statebutton = false;
    }
    state++;
    UserReferProduct reference = ModalRoute.of(context).settings.arguments;
    int salgadoSelect = reference.id;
    carousel = new CarouselSlider(
        options: CarouselOptions(
          disableCenter: true,
          onPageChanged: ((f, index) {
            setState(() {
              pagAtual = f + 1;
            });
          }),
          initialPage: salgadoSelect - 1,
          height: 490,
          enlargeCenterPage: true,
        ),
        carouselController: buttonCarouselController,
        items: salgados.map((it) {
          Salgado salgado = currentSalgado(it);
          return Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 15),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 40.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff707070)),
                      color: Color(0xff1f7b67),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text(
                    "${salgado.nome}",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  )),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  child: Container(
                    height: 350,
                    child: Image(
                        fit: BoxFit.cover, image: AssetImage(salgado.caminho)),
                  ),
                ),
              ],
            ),
          );
        }).toList());
    if (state == 1) {
      pagAtual = salgadoSelect;
    }
    return Scaffold(
      backgroundColor: Color(0xff34d2af),
      body: SingleChildScrollView(

        child: Container(
          
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                      height: 700,
                      child: Column(
                        children: <Widget>[
                          carousel,
                        ],
                      )),
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(80, 20, 80, 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              buttonCarouselController.previousPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                            });
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            child: Icon(Icons.arrow_left),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              buttonCarouselController.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeIn);
                            });
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            child: Icon(Icons.arrow_right),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(120, 370, 120, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (quant > 0) {
                                quant--;
                              }
                            });
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            child: Icon(Icons.remove),
                          ),
                        ),
                        Container(
                          width: 60.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color(0xff707070), width: 1.0))),
                          child: Center(
                              child: Text(
                            "$quant",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          )),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              quant++;
                            });
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            child: Icon(Icons.add),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(top: 10),
                            width: 76,
                            height: 100,
                            child: amoutSelect()),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Container(
                            padding: EdgeInsets.only(top: 10),
                            height: 100,
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: ListView.builder(
                                controller: scroll,
                                scrollDirection: Axis.horizontal,
                                itemCount: clicks,
                                itemBuilder: (context, n) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                    child: cart[n],
                                  );
                                }),
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 100,
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (quant > 0) {
                                    final String nome =
                                        currentSalgado(pagAtual).nome;
                                    final String caminho =
                                        currentSalgado(pagAtual).caminho;
                                    final double value = double.parse(
                                        currentSalgado(pagAtual).valor);
                                    final Container add = productPurchased(
                                        caminho, quant.toString(),
                                        valor: value, id: idProduct);
                                    final Cartproduct cartSelect =
                                        Cartproduct(nome, quant, value);
                                    cartFinal.add(cartSelect);
                                    cart.add(add);
                                    clicks++;
                                    total = total + (value * quant);
                                    total =
                                        double.parse(total.toStringAsFixed(2));
                                    quant = 0;
                                    idProduct++;
                                    scroll.jumpTo(
                                        scroll.position.maxScrollExtent + 100);
                                  }
                                });
                              },
                              child: Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    children: <Widget>[
                                      Text("Adicionar"),
                                      Image.asset("imgs/cartBest.png"),
                                    ],
                                  ))),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("Total:R\$$total ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Observer(
                        builder: (_) {
                          return RaisedButton(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Color(0xff707070)),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            padding: EdgeInsets.fromLTRB(50, 10, 50, 0),
                            color: productState.statebutton
                                ? Color(0xff5e48d8)
                                : Color(0xff707070),
                            child: Container(
                              height: 50,
                              width: 240,
                              margin: EdgeInsets.all(0),
                              child: Center(
                                child: Text(
                                  "Continuar",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (productState.statebutton) {
                                Navigator.pushNamed(context, "/InfoEntrega",
                                    arguments: CartAndUser(
                                        CartproductsTotal(total, cartFinal),
                                        reference.email));
                              } else {
                                return showDialog(
                                  context: context,
                                  child: AlertDialog(
                                    title: Text("Há algo errado"),
                                    content: Text("O carrinho está vazio"),
                                    actions: <Widget>[
                                      FlatButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Comprar"))
                                    ],
                                  ),
                                );
                              }
                            },
                          );
                        },
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container amoutSelect() {
    String caminho = currentSalgado(pagAtual).caminho;
    Container addInit = productPurchased(caminho, quant.toString(), option: '');
    return addInit;
  }

  Container productPurchased(String caminho, String n,
      {String option, double valor, int id}) {
    final Key s = Key('$id');
    final double preco = valor;
    final String way = caminho;
    final String amount = n;

    if (option != null) {
      return Container(
        height: 86,
        width: 75,
        child: Column(
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  border: Border.all(color: Color(0xff000000), width: 2),
                ),
                height: 55,
                width: 75,
                child: Image.asset(
                  way,
                  fit: BoxFit.cover,
                )),
            Container(
                width: 75,
                height: 25,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  border: Border.all(color: Color(0xff000000), width: 2),
                ),
                child: Text(
                  amount,
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ))
          ],
        ),
      );
    }
    return Container(
        key: s,
        height: 86,
        width: 75,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      border: Border.all(color: Color(0xff000000), width: 2),
                    ),
                    height: 55,
                    width: 75,
                    child: Image.asset(
                      way,
                      fit: BoxFit.cover,
                    )),
                Container(
                    width: 75,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      border: Border.all(color: Color(0xff000000), width: 2),
                    ),
                    child: Text(
                      amount,
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ))
              ],
            ),
            Positioned(
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      idProduct--;
                      final int quanti = int.parse(amount);

                      print(id.toString());
                      total = double.parse(
                          (total - (quanti * preco)).toStringAsFixed(2));
                      print("aqui");

                      cart.removeAt(id);
                      cartFinal.removeAt(id);

                      cart.removeWhere((container) => container.key == s);
                      clicks--;
                    });
                  },
                  child: Image(
                    image: AssetImage('imgs/xCirc.png'),
                    height: 20,
                    width: 20,
                  ),
                )),
          ],
        ));
  }
}
