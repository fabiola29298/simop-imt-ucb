import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 
import 'package:flutter_blue_example/flare_page.dart'; 
import 'package:flare_flutter/flare_actor.dart';
  
import 'package:flutter_blue_example/provider/datainfo.dart';

//https://github.com/2d-inc/Flare-Flutter/blob/stable/example/penguin_dance/lib/main.dart

class ShowFlareAnimation extends StatefulWidget {
  
  @override
  _ShowFlareAnimationState createState() => _ShowFlareAnimationState();
}

class _ShowFlareAnimationState extends State<ShowFlareAnimation> {
  String _animationName = 'hombre0';

  @override
  Widget build(BuildContext context) {
    
    final dataInfo   = Provider.of<DataInfo>(context); 

    return 
    Column(
     // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
 
        flareAnimation(dataInfo),
        RaisedButton(
          child: Text("dato 50"),
          onPressed: () {
            setState(() {
              _animationName = "hombro50";
              dataInfo.datax='50';
            });
          },
        ),
        RaisedButton(
          child: Text("dato 100"),
          onPressed: () {
            setState(() {
              _animationName = "hombro100";
              dataInfo.datax='100';
            });
          },
        ),
        RaisedButton(
          child: Text("dato 0"),
          onPressed: () {
            setState(() {
              _animationName = "hombre0";
              dataInfo.datax='0';
            });
          },
        ),
        

      ],
    );
    
  }
String cambiarAnimation(DataInfo dataInfo){
  String newAnimation='';
  int dataInt = int.parse(dataInfo.datax);
   
  if(dataInt>35 || dataInt <65){
    newAnimation ='hombro50';
  }
  else{
    if(dataInt>35){
      newAnimation ='hombre0';
    }
    else{
      newAnimation ='hombro100';
    }
  }

  return newAnimation;


}
Widget flareAnimation(DataInfo dataInfo){
  
  return Container(
          width: 800.0,
          height: 300.0,
          child: FlareActor(
            'assets/img/prueba2.flr',
            alignment: Alignment.center,
            fit: BoxFit.contain,
            animation: _animationName,
          ),
  );
}
}
