 
import 'package:flutter/material.dart'; 
import 'package:flutter_blue_example/provider/db_providers.dart'; 
 
import 'package:intl/intl.dart';

class SaveDataMysql extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title:Text('Base de datos'),
       ),
       body: Padding(
         padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: _mostrarData(context),
       )
       
     );
  }

  Widget _mostrarData (BuildContext context){
    return FutureBuilder<List<DataModel>>(
      future: DBProvider.db.getTodosScans(), 
      builder: (BuildContext context, AsyncSnapshot<List<DataModel>> snapshot) {
        
        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator(),);
        }
        final scans = snapshot.data;

        if(scans.length ==0){
          return Center(child: Text('No hay datos '));
        }
        
        
        return ListView.builder(
          itemCount: scans.length,
          itemBuilder: (context,i)=>
          Dismissible(
            key: UniqueKey(),
            background: Container(color: Colors.red),
            onDismissed: (direccion)=>DBProvider.db.deleteScan(scans[i].id),

            child: Card(
              
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text('posicion: ${scans[i].dato1}   ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15.0),),
                    Text('fecha:    ${scans[i].date1} ', style: TextStyle(color: Colors.black , fontSize: 12.0) ),
                  ],
                ),
              ),
            ),
          )
          
        );
      },
    );
  }
}



