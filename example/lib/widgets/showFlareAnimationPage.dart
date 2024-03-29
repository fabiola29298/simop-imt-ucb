import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import 'package:flare_flutter/flare_actor.dart';
  
import 'package:flutter_blue_example/provider/datainfo.dart';

//https://github.com/2d-inc/Flare-Flutter/blob/stable/example/penguin_dance/lib/main.dart

class ShowFlareAnimation extends StatefulWidget {
   
  @override
  _ShowFlareAnimationState createState() => _ShowFlareAnimationState();
}

class _ShowFlareAnimationState extends State<ShowFlareAnimation> {
   
  
  @override
  Widget build(BuildContext context) {
    
    final dataInfo   = Provider.of<DataInfo>(context); 
    return     
          new Container(
            width: 800.0,
            height: 300.0,
            child: flareAnimation(dataInfo.animationX),
          );
    
  }
 
Widget flareAnimation(String animationX){
   
  return Consumer<DataInfo>(
      
      builder: (context, dataInfo,  _) => new FlareActor(
            'assets/img/counter1.flr',
            alignment: Alignment.center,
            fit: BoxFit.contain,
            animation: animationX,
            
          ),
  );
}
}
