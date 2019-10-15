import 'package:flutter/material.dart';
import 'package:flutter_blue_example/widgets/saveDataMysqlPage.dart';
import 'package:flutter_blue_example/widgets/showDataProviderPage.dart';
 
class HomePage extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {
     
     return Scaffold(
      appBar: AppBar(
        title: Text( 'SIMOP - Menu principal' ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[ 
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _contentWidget(context)
                
              ]
            ),
          )
        ],
      ),
      floatingActionButton: _superFloatingAction(context),
    );
  }


  Widget _contentWidget(BuildContext context){
    return Column(
      children: <Widget>[
        SizedBox(height: 15.0,),
        Text('Bienvenido a SIMOP'),
        ShowDataProvider(),
        botonBaseDatos(context), 
        
         



      ],

    );

  }
  botonBaseDatos(BuildContext context ){
     
     
    return RaisedButton(
          child: Text('Ver Base de datos'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: (){
             Navigator.pushNamed(context, 'basedatos' );
          },
        );
  }
  botonNotificationWidget(BuildContext context ){
     
     
    return RaisedButton(
          child: Text('Ver notification'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: (){
             Navigator.pushNamed(context, 'notificationWidget' );
          },
        );
  }
  Widget _superFloatingAction(BuildContext context){

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
         
        SizedBox( height: 10.0 ),
        FloatingActionButton(
          child: Icon( Icons.play_circle_filled  ),
          backgroundColor: Colors.blue,
          onPressed: () {
             Navigator.pushNamed(context, 'bluetooth' );
          },
        ),
      ],
    );
  }
}