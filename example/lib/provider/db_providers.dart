import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter_blue_example/models/data_model.dart';
export 'package:flutter_blue_example/models/data_model.dart';



class DBProvider {

  static Database _database; 
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {

    if ( _database != null ) return _database;

    _database = await initDB();
    return _database;
  }


  initDB() async {

    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join( documentsDirectory.path, 'ScansDB.db' );

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: ( Database db, int version ) async {
        await db.execute(
          'CREATE TABLE Scans ('
          ' id INTEGER PRIMARY KEY,'
          ' dato1 TEXT,'
          ' dato2 TEXT,'
          ' date1 TEXT'
          ')'
        );
      }
    
    );

  }
 

  nuevoScan( DataModel nuevoScan ) async {

    final db  = await database;
    final res = await db.insert('Scans',  nuevoScan.toJson() );
    return res;
  }


  // SELECT - Obtener información
  Future<DataModel> getScanId( int id ) async {

    final db  = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]  );
    return res.isNotEmpty ? DataModel.fromJson( res.first ) : null;

  }

  Future<List<DataModel>> getTodosScans() async {

    final db  = await database;
    final res = await db.query('Scans');

    List<DataModel> list = res.isNotEmpty 
                              ? res.map( (c) => DataModel.fromJson(c) ).toList()
                              : [];
    return list;
  }
 
   
  Future<List<DataModel>> getScansPordato1( String dato1 ) async {

    final db  = await database;
    final res = await db.rawQuery("SELECT * FROM Scans WHERE dato1='$dato1'");

    List<DataModel> list = res.isNotEmpty 
                              ? res.map( (c) => DataModel.fromJson(c) ).toList()
                              : [];
    return list;
  }

  // Actualizar Registros
  Future<int> updateScan( DataModel nuevoScan ) async {

    final db  = await database;
    final res = await db.update('Scans', nuevoScan.toJson(), where: 'id = ?', whereArgs: [nuevoScan.id] );
    return res;

  }

  // Eliminar registros
  Future<int> deleteScan( int id ) async {

    final db  = await database;
    final res = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAll() async {

    final db  = await database;
    final res = await db.rawDelete('DELETE FROM Scans');
    return res;
  }

}

