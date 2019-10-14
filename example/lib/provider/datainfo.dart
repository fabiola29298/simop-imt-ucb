import 'package:flutter/material.dart';

class DataInfo with ChangeNotifier {

  String _datax = 'Capitán América';
  Color colorBase = Colors.blue;


  get datax {
    return _datax;
  }

  set datax( String dataxNew ) {
    this._datax = dataxNew;

     
    notifyListeners();
  }

}