import 'package:flutter/material.dart';
import 'package:flutter_blue_example/provider/db_providers.dart';
import 'package:flutter_blue_example/widgets/showFlareAnimationPage.dart';
import 'package:provider/provider.dart'; 
import 'package:flutter_blue_example/provider/datainfo.dart';
import 'dart:math';

class ShowDataProvider extends StatefulWidget {
  
  @override
  _ShowDataProviderState createState() => _ShowDataProviderState();
}

class _ShowDataProviderState extends State<ShowDataProvider> {
  
  @override
  Widget build(BuildContext context) {
    
    final dataInfo   = Provider.of<DataInfo>(context); 

    return 
    Column( 
      children: <Widget>[
 
        SizedBox(height: 10.0,),
        Text( 'dato: ${dataInfo.datax} \ntime: ${dataInfo.time} \nanimation: ${dataInfo.animationX} ', 
          style: TextStyle( 
            fontSize: 15.0,
          ),
        ),
         
        botonWidget(context, dataInfo),
        ShowFlareAnimation()
        

         

      ],
    );
    
  }

  botonWidget(BuildContext context,   DataInfo dataInfo){
    var rng = new Random();
    int numberRandom;
    return RaisedButton(
          child: Text('Cambiar dato random'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: (){
            
            numberRandom =  rng.nextInt(101);
            dataInfo.datax= numberRandom.toString();
            _guardarMysql(dataInfo.datax, dataInfo.time);
           /* if(_name=='arrow100to100'){
              _name= 'arrow100to0';
            }
            else{
              _name= 'arrow100to100';
            }
           */
          },
        );
  }

  void _guardarMysql(String data,String date ){  
 
      final scan = DataModel(dato1: data, date1: date );
      DBProvider.db.nuevoScan(scan);
     

  }


}
