import 'package:flutter/material.dart';
import 'package:rango_time_app/Agendar/Agendar-controller.dart';
import 'package:rango_time_app/model/Background-Curve.dart';
import 'package:rango_time_app/model/UserLogin.dart';

class Agendar extends StatefulWidget {
  @override
  _AgendarState createState() => _AgendarState();
}

class _AgendarState extends State<Agendar> {
  List<DropdownMenuItem<String>> _dropDownMenuItemsdia;
  List<DropdownMenuItem<String>> _dropDownMenuItemsmes;
  List<DropdownMenuItem<String>> _dropDownMenuItemshora;
  String _currentdia;
  String _currentmes;
  String _currenthora;
  bool agendaConfirm = false;
  @override
  void initState() {
    _dropDownMenuItemsdia = getDropDownMenuItemsdias();
    _dropDownMenuItemsmes = getDropDownMenuItemsmeses();
    _dropDownMenuItemshora = getDropDownMenuItemshorarios();
    _currentdia = _dropDownMenuItemsdia[0].value;
    _currentmes = _dropDownMenuItemsmes[0].value;
    _currenthora = _dropDownMenuItemshora[0].value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String refer = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        backgroundColor: Color(0xff34d2af),
        body: Stack(
          children: <Widget>[
            backgroundCurve(context),
            Column(
              children: <Widget>[
                SizedBox(height: 60),
                Center(
                    child:
                        Text("Agendar pedido", style: TextStyle(fontSize: 28))),
                SizedBox(height: 40),
                Container(
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Dia", style: TextStyle(fontSize: 20)),
                      Text("Mês", style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 280,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Container(
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: DropdownButton(
                              underline: Container(
                                  height: 0,
                                  color: Colors.white,
                                ),
                                value: _currentdia,
                                items: _dropDownMenuItemsdia,
                                onChanged: (e) {
                                  setState(() {
                                    _currentdia = e;
                                  });
                                }),
                          ),
                        ),
                      ),
                      Text(
                        "/",
                        style:
                            TextStyle(fontSize: 40, color: Color(0xff707070)),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Container(
                          width: 80,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: DropdownButton(
                              underline: Container(
                                  height: 0,
                                  color: Colors.white,
                                ),
                                value: _currentmes,
                                items: _dropDownMenuItemsmes,
                                onChanged: (e) {
                                  setState(() {
                                    _currentmes = e;
                                  });
                                }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 120, 30, 90),
                  child: Container(
                    width: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Horario",
                            style:
                                TextStyle(fontSize: 24, color: Colors.white)),
                        Container(
                            width: 80,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: DropdownButton(
                                underline: Container(
                                  height: 0,
                                  color: Colors.white,
                                ),
                                items: _dropDownMenuItemshora,
                                onChanged: (e) {
                                  setState(() {
                                    _currenthora = e;
                                  });
                                },
                                value: _currenthora,
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 250,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Checkbox(
                            value: agendaConfirm,
                            onChanged: (e) {
                              setState(() {
                                agendaConfirm = !agendaConfirm;
                              });
                            },
                          )),
                      Text(
                        "Confirmar Agendamento",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              bottom: 0,
              right: MediaQuery.of(context).size.width * 0.05,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                      side: BorderSide(color: Color(0xff707070))),
                  color: Color(0xff5e48d8),
                  child: Container(
                    height: 50,
                    width: 280,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Align(
                      alignment: Alignment(0, 0.4),
                      child: Text(
                        "Confirmar Agendamento",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (agendaConfirm = true) {
                      return showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              title: Text("Agendar?"),
                              content: Text("Confirmar agendamento?"),
                              actions: <Widget>[
                                FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Cancelar")),
                                FlatButton(
                                    onPressed: () {
                                      Navigator.popAndPushNamed(
                                          context, "/Home",
                                          arguments: LoginUser(refer));
                                    },
                                    child: Text("Confirmar"))
                              ],
                            );
                          });
                    }
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
