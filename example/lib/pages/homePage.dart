import 'package:flutter/material.dart';
 
class HomePage extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 'SIMOP - Menu principal' ),
      ),
      body: Center(
        child: _contentWidget()
      ),
      floatingActionButton: _superFloatingAction(context),
    );
  }


  Widget _contentWidget(){
    return Column(
      children: <Widget>[
        SizedBox(height: 15.0,),
        Text('Bienvenido a SIMOP'),



      ],

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