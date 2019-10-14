import 'package:flutter/material.dart';
import 'package:flutter_blue_example/widgets/showFlareAnimationPage.dart';
import 'package:provider/provider.dart'; 

import 'package:flutter_blue_example/provider/datainfo.dart';

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


        Text( 'Mostrando data:', 
          style: TextStyle( 
            fontSize: 10.0,
            
          ),
        ),Text( dataInfo.datax, 
          style: TextStyle( 
            fontSize: 20.0,
            
          ),
        ),
        _botonWidget(context, dataInfo),
        ShowFlareAnimation()
        

         

      ],
    );
    
  }


  _botonWidget(BuildContext context,   DataInfo dataInfo){
    return RaisedButton(
          child: Text('Cambiar dato'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: (){
             dataInfo.datax= '100';
          },
        );
  }
  
 
}
