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
import 'package:flutter_blue_example/widgets/local_notification_widget.dart';
import 'package:flutter_blue_example/widgets/saveDataMysqlPage.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
 
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
           'basedatos'         : (context) => SaveDataMysql(),
           'notificationWidget': (context) => LocalNotificationWidget(),

           
           'deviceScreen'         : (context) => DeviceScreen(),
         },
      
      
      initialRoute: 'home',
            
      ),
    );
  }
}
 