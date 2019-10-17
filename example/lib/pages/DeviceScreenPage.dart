
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart'; 
import 'package:flutter_blue_example/widgets.dart';
import 'package:flutter_blue_example/widgets/showDataProviderPage.dart'; 
  
import 'package:flutter_swiper/flutter_swiper.dart';

  class DeviceScreen extends StatelessWidget {
  const DeviceScreen({Key key, this.device}) : super(key: key);

  final BluetoothDevice device;

  List<Widget> _buildServiceTiles(List<BluetoothService> services) {
    return services
        .map(
          (s) => ServiceTile(
                service: s,
                characteristicTiles: s.characteristics
                    .map(
                      (c) => CharacteristicTile(
                            characteristic: c,
                            onReadPressed: () {
                              c.read();
                              // aqui entra a awidgets para crear la lista
                              
                            } ,
                            onWritePressed: () => c.write([101]),
                            onNotificationPressed: () =>
                                c.setNotifyValue(!c.isNotifying),
                            descriptorTiles: c.descriptors
                                .map(
                                  (d) => DescriptorTile(
                                        descriptor: d,
                                        onReadPressed: () => d.read(),
                                        onWritePressed: () => d.write([11, 12]),
                                      ),
                                )
                                .toList(),
                          ),
                    )
                    .toList(),
              ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {

      final _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(device.name),
        actions: <Widget>[
          StreamBuilder<BluetoothDeviceState>(
            stream: device.state,
            initialData: BluetoothDeviceState.connecting,
            builder: (c, snapshot) {
              VoidCallback onPressed;
              String text;
              switch (snapshot.data) {
                case BluetoothDeviceState.connected:
                  onPressed = () => device.disconnect();
                  text = 'DISCONNECT';
                  break;
                case BluetoothDeviceState.disconnected:
                  onPressed = () => device.connect();
                  text = 'CONNECT';
                  break;
                default:
                  onPressed = null;
                  text = snapshot.data.toString().substring(21).toUpperCase();
                  break;
              }
              return FlatButton(
                  onPressed: onPressed,
                  child: Text(
                    text,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .button
                        .copyWith(color: Colors.white),
                  ));
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            StreamBuilder<BluetoothDeviceState>(
              stream: device.state,
              initialData: BluetoothDeviceState.connecting,
              builder: (c, snapshot) => ListTile(
                    leading: (snapshot.data == BluetoothDeviceState.connected)
                        ? Icon(Icons.bluetooth_connected)
                        : Icon(Icons.bluetooth_disabled),
                    title: Text(
                        'Device is ${snapshot.data.toString().split('.')[1]}.'),
                    subtitle: Text('${device.id}'),
                    trailing: StreamBuilder<bool>(
                      stream: device.isDiscoveringServices,
                      initialData: false,
                      builder: (c, snapshot) => IndexedStack(
                            index: snapshot.data ? 1 : 0,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.refresh),
                                onPressed: () => device.discoverServices(),
                              ),
                              IconButton(
                                icon: SizedBox(
                                  child: CircularProgressIndicator(
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.grey),
                                  ),
                                  width: 18.0,
                                  height: 18.0,
                                ),
                                onPressed: null,
                              )
                            ],
                          ),
                    ),
                  ),
            ),
            StreamBuilder<List<BluetoothService>>(
              stream: device.services,
              initialData: [],
              builder: (c, snapshot) {
                return CustomScrollView(
                  slivers: <Widget>[ 
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Container(
                            width: _screenSize.width,
                            height:  _screenSize.height * 0.4, 
                            padding: EdgeInsets.only(top: 10.0),
                            child:   Column(
                                  children: 
                                  _buildServiceTiles(snapshot.data),
                                ),  
                          ),
                          Container( 
                            width: _screenSize.width,
                            height:  _screenSize.height * 0.6,
                            child:Column(
                              children: <Widget>[
                                SizedBox(height: 15.0,),
                                Text('Bienvenido a SIMOP'),
                                ShowDataProvider(),
                                botonBaseDatos(context),  
                              ], 
                            )
                          )
                        ]
                      ),
                    )
                  ],
                );
              },
            ),
          ],
          
        ),
      ),
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
}