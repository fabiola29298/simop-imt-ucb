import 'package:flutter/material.dart';

class DataInfo with ChangeNotifier {

  String _datax = '50';
  String animationX = 'hombro50';


  get datax {
    return _datax;
  }

  set datax( String dataxNew ) {
    this._datax = dataxNew;
    this.animationX = cambiarAnimation(dataxNew);
     
    notifyListeners();
  }


  String cambiarAnimation(String dataNex){
    String newAnimation='';
    int dataInt = int.parse(dataNex);
    
    if(dataInt>35 && dataInt <65){
      newAnimation ='hombro50';
    }
    else{
      if(dataInt<35){
        newAnimation ='hombre0';
      }
      else{
        newAnimation ='hombro100';
      }
    }

    return newAnimation;
  }
}