// Copyright 2017, Paul DeMarco.
//https://github.com/pauldemarco/flutter_blue
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
 
import 'package:flutter/material.dart';
import 'package:flutter_blue_example/pages/BluetoothOffScreenPage.dart';
import 'package:flutter_blue_example/pages/DeviceScreenPage.dart';
import 'package:flutter_blue_example/pages/FindDevicesScreenPage.dart';
import 'package:flutter_blue_example/pages/bluetoothPage.dart';
import 'package:flutter_blue_example/pages/homePage.dart';
import 'package:flutter_blue_example/provider/datainfo.dart';
import 'package:provider/provider.dart';

import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_blue_example/flare_page.dart'; 
import 'package:flare_flutter/flare_actor.dart';
  
void main() {
  runApp(FlutterBlueApp());
}

class FlutterBlueApp extends StatefulWidget {
  @override
  _FlutterBlueAppState createState() => _FlutterBlueAppState();
}

class _FlutterBlueAppState extends State<FlutterBlueApp> {
 

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => DataInfo(),
      child: MaterialApp(
      color: Colors.lightBlue,
      
      routes: {
           'findDevicesScreen' : (context) => FindDevicesScreen(),
           'bluetoothOffScreen': (context) => BluetoothOffScreen(),
           'home'              : (context) => HomePage(),
           'bluetooth'         : (context) => BluetoothPage(),

           'deviceScreen'         : (context) => DeviceScreen(),
         },
      
      
      initialRoute: 'home',
            
      ),
    );
  }
}

/*
//https://github.com/2d-inc/Flare-Flutter/blob/stable/example/penguin_dance/lib/main.dart
Widget box1(){
  String _animationName = 'hombre0';
  return Column(
              children: <Widget>[
              SizedBox(height: 15.0,),
              Text('Bienvenido a SIMOP'),
              MyHomePage(title: 'Rockin\' Penguin'),
              Container(
                width: 500.0,
                height: 300.0,
                child: FlareActor(
                  'assets/img/prueba2.flr',
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  animation: _animationName,
                ),
              ),
              Row(children: <Widget>[
                FlatButton(child: Text('Build'), onPressed: (){},),
                FlatButton(child: Text('Build2'), onPressed: (){
                  
                },)
              ],)
              ], 
              );
}
*/