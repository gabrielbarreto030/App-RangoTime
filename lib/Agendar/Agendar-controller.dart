import 'package:flutter/material.dart';

List<DropdownMenuItem<String>> getDropDownMenuItemsdias() {
  List dias = ["01", "02", "03", "04", "05", "06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"];
  
  DateTime now = DateTime.now();
  if(now.month>1){
      dias.removeRange(0,now.month-1);
      
  }
  List<DropdownMenuItem<String>> items = new List();
  
  for (String item in dias) {
    items.add(new DropdownMenuItem(value: item, child: new Text(item)));
  }
  return items;
}

List<DropdownMenuItem<String>> getDropDownMenuItemsmeses() {
  List meses = [
    "Jan",
    "Fev",
    "Mar",
    "Abr",
    "Mai",
    "Jun",
    "Jul",
    "Ago",
    "Set",
    "Out",
    "Nov",
    "Dez"
  ];
  DateTime now = DateTime.now();
  if(now.month>1){
      meses.removeRange(0,now.month-1);
      
  }
  
  
  List<DropdownMenuItem<String>> items = new List();
  for (String item in meses) {
    items.add(new DropdownMenuItem(value: item, child: new Text(item)));
  }
  return items;
}
  

List<DropdownMenuItem<String>> getDropDownMenuItemshorarios() {
  List horarios = ["08:00", "09:00", "10:00", "11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00"];
   DateTime now = DateTime.now();
   print(now.hour);
   if(now.hour>16){
      horarios.removeRange(0,now.hour-8);
   }
  List<DropdownMenuItem<String>> items = new List();
  for (String item in horarios) {
    items.add(new DropdownMenuItem(value: item, child: new Text(item)));
  }
  return items;
}
