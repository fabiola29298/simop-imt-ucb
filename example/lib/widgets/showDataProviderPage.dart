import 'package:flutter/material.dart';
import 'package:flutter_blue_example/widgets/showFlareAnimationPage.dart';
import 'package:provider/provider.dart'; 

import 'package:flutter_blue_example/provider/datainfo.dart';
import 'dart:math';

class ShowDataProvider extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    final dataInfo   = Provider.of<DataInfo>(context); 

    return 
    Column(
     // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        // Consumer<HeroesInfo>(
        //   builder: (context, heroesInfo, _ ) => Text( heroesInfo.heroe, 
        //     style: TextStyle( 
        //       fontSize: 30.0,
        //       color: heroesInfo.colorBase
        //     ),
        //   )
        // )

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
          /*  if(dataInfo.datax=='100'){
              dataInfo.datax= '50';
            }
            else{
              dataInfo.datax= '100';
            }
          */   
          },
        );
  }
  
 
}
