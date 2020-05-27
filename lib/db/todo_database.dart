import 'dart:async';

import 'package:flutterapp2/db/todo_table.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TodoDatabse {
  static const DB_NAME = 'todo.db';
  static const DB_VERSION = 7;
  static Database  _database;

  static TodoDatabse instance ;
  TodoDatabse._internal();
  static TodoDatabse getInstance(){
    if(instance == null){
      instance = TodoDatabse._internal();
    }
    return instance;
  }


  Database get database => _database;

  static const initScripts = [TodoTable.CREATE_TABLE_QUERY];
  static const migrationScripts = [TodoTable.CREATE_TABLE_QUERY];

  int() async{
    _database = await openDatabase(
      join(await getDatabasesPath(),DB_NAME),
      onCreate: (db,version){
        print('z');
        initScripts.forEach((script) async => await db.execute(script));
      },
      onUpgrade :(db,oldVersion,newVersion){
        print('2');
        migrationScripts.forEach((script) async => await db.execute(script));
      },
      onDowngrade: onDatabaseDowngradeDelete,
      version: DB_VERSION
    );
  }
}