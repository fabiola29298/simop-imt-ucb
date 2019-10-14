import 'package:flutter/material.dart'; 
import 'package:intl/intl.dart';

class DataInfo with ChangeNotifier {

  String _datax = '50';
  String _animationX = 'hombro50';
  String _time = '2000-00-00 00:00:00';


  get datax {
    return _datax;
  }

  set datax( String dataxNew ) {
    this._datax = dataxNew;
    this._animationX = cambiarAnimation(dataxNew);
    this._time = cambiarTime();
     
    notifyListeners();
  }

  get animationX {
    return _animationX;
  }

  get time {
    return _time;
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

  String cambiarTime (){
    DateTime now = new DateTime.now();
    String formatteDate = DateFormat('kk:mm:ss dd/MM/yyyy').format(now);
    return formatteDate;
  }
}