import 'package:flutter/material.dart';
import 'package:flutter_blue_example/provider/db_providers.dart';
import 'package:flutter_blue_example/widgets/showFlareAnimationPage.dart';
import 'package:provider/provider.dart'; 
import 'package:flutter_blue_example/provider/datainfo.dart';
import 'dart:math';

 
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


import 'package:flutter_blue_example/local_notications_helper.dart';
import 'package:flutter_blue_example/pages/notificationPage.dart';

class ShowDataProvider extends StatefulWidget {
  
  @override
  _ShowDataProviderState createState() => _ShowDataProviderState();
}

class _ShowDataProviderState extends State<ShowDataProvider> {
  // local notification START

  final notifications = FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState(); 
    final settingsAndroid = AndroidInitializationSettings('launch_background');
    final settingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) =>
            onSelectNotification(payload));

    notifications.initialize(
        InitializationSettings(settingsAndroid, settingsIOS),
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) async { 
        
        notifications.cancelAll();
        await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NotificationPage(payload: payload)),
      );
      }

  @override 

  // local notification END
  @override
  Widget build(BuildContext context) {
    
    final dataInfo   = Provider.of<DataInfo>(context); 

    return 
    Column( 
      children: <Widget>[
 
        SizedBox(height: 10.0,),
        Divider(),
        Text( 'dato: ${dataInfo.datax} \ntime: ${dataInfo.time}', 
          style: TextStyle( 
            fontSize: 15.0,
          ),
        ),
        Divider(),
        botonWidget(context, dataInfo),
        ShowFlareAnimation(),
        //buttonClearNotification( )
        

         

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
            
            // Local Notification  numberRandom<35

            launchNotification(numberRandom);
          },
        );
  }
  void launchNotification(int number){

    if(number<35 || number >65 ){
      showOngoingNotification(notifications,
      title: 'Atencion!!', body: 'Cambia tu postura');
    }

     
  }

/*Widget buttonClearNotification(){
  return RaisedButton(
          child: Text('Limpiar notificaciones'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: (){
            clearNotification();
          },
        );
} 
*/  
  void _guardarMysql(String data,String date ){  
 
      final scan = DataModel(dato1: data, date1: date );
      DBProvider.db.nuevoScan(scan);
     

  }


}
