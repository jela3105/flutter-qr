import 'dart:io';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:qr_app/models/scan_model.dart';
export 'package:qr_app/models/scan_model.dart';

class DBProvider {
  static Database _database;

  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return database;
    _database = await initDB();

    return _database;
  }

  Future<Database> initDB() async {
    //Path where the database is gonna be saved
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db');
    print(path);

    //create database

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('''
	  CREATE TABLE Scans(
	    id INTEGER PRIMARY KEY, 
	    type TEXT, 
	    value TEXT
	  )
	''');
      },
    );
  }

  Future<int> newScanRaw(ScanModel newScan) async {
    final id = newScan.id;
    final type = newScan.type;
    final value = newScan.value;

    final db = await database;

    final res = await db.rawInsert('''
	  INSERT INTO Scans(id, type, value)
	  VALUES ( $id , $type, $value)
	''');
    return res;
  }

  Future<int> newScan(ScanModel newScan) async {
    final db = await database;
    final res = await db.insert('Scans', newScan.toJson());
    return res;
  }
}
