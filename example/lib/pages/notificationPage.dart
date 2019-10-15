
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  final String payload;

  const NotificationPage({
    @required this.payload,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
        title: Text( 'SIMOP - Notificacion' ),
      ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.add_alert,
                color: Colors.green,
                size: 50.0,
              ),
              Text(
                'Corrige tu postura',
                style: Theme.of(context).textTheme.title,
              ),
              const SizedBox(height: 8),
              Text(
                payload,
                style: Theme.of(context).textTheme.subtitle,
              ),
              const SizedBox(height: 8),
              RaisedButton(
                child: Text('Volver'),
                onPressed: () => Navigator.pushNamed(context, 'home' )
              ),
            ],
          ),
        ),
      );
}
