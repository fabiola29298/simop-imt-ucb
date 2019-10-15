import 'package:flutter/material.dart'; 
import 'package:intl/intl.dart';

class DataInfo with ChangeNotifier {

  String _datax = '50';
  String _animationX = 'arrow50to50';
  String _time = '2000-00-00 00:00:00';


  get datax {
    return _datax;
  }

  set datax( String dataxNew ) {
    this._animationX = cambiarAnimation(dataxNew);
    this._time = cambiarTime();
    this._datax = dataxNew;
    
    
     
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
    //print('previous= $_datax - next= $dataNex');
    int dataInt = int.parse(dataNex);
    int dataPrevious= int.parse(_datax);
    
    if(dataPrevious>35 && dataPrevious <65){
      
      if(dataInt>35 && dataInt <65 ){
          newAnimation ='arrow50to50';
          return newAnimation;
      }
      else{

      if(dataInt>=65){
        newAnimation ='arrow50to100';
        return newAnimation;
      }
      else{
        if(dataInt<=35){
        newAnimation ='arrow50to0';
        return newAnimation;
      }
      }
      }
    }
    else{
      if(dataPrevious<=35){
        if(dataInt>35 && dataInt <65 ){
          newAnimation ='arrow0to50';
          return newAnimation;
        }
        else{

        if(dataInt>=65){
          newAnimation ='arrow0to100';
          return newAnimation;
        }
        else{
          if(dataInt<=35){
          newAnimation ='arrow0to0';
          return newAnimation;
        }
        }
        }
      }
      else{
        if(dataPrevious>=65){
        if(dataInt>=65){
          newAnimation ='arrow100to100';
          return newAnimation;
        }
        else{
          if(dataInt>35 && dataInt <65 ){
          newAnimation ='arrow100to50';
          return newAnimation;
        } 
        else{
          if(dataInt<=35){
          newAnimation ='arrow100to0';
          return newAnimation;
        }
        }
        }
      }
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