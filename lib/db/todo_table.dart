
import 'package:flutterapp2/Model/Todo.dart';
import 'package:flutterapp2/db/todo_database.dart';
import 'package:sqflite/sqflite.dart';

class TodoTable {
  static const TABLE_NAME = 'todos';
  static const CREATE_TABLE_QUERY = 'CREATE TABLE todos(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT, description INTEGER, done INTEGER DEFAULT 0)';
  static const DROP_TABLE_QUERY = 'DROP TABLE IF EXISTS $TABLE_NAME';

  Future<void> insertTodo(Todo todo) async {
    final Database db = TodoDatabse.instance.database;
    await db.insert(
      TABLE_NAME,
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace
    );
  }
  Future<void> deleteTodo(Todo todo) async {
    final Database db = TodoDatabse.instance.database;
    await db.delete(
        TABLE_NAME,
        where: 'id = ?',
        whereArgs: [todo.id]
    );
  }
  Future<List<Todo>> getAllTodo(int id) async {
    final Database db = TodoDatabse.instance.database;
    final List<Map<String,dynamic>> maps = await db.query(
        'todos',
         where: (id != 0) ? 'id = ?' : null,
         whereArgs: (id != 0) ? [id] : [],
    );
    return List.generate(maps.length, (index) => Todo(
        id: maps[index]['id'],
        title: maps[index]['title'],
        description: maps[index]['description'].toString(),
        done :maps[index]['done']
    ));
  }
  Future<void> updateTodo(Todo todo) async {
    final Database db = TodoDatabse.instance.database;
    await db.update(
        TABLE_NAME,
        todo.toMap(),
        where: 'id = ?',
        whereArgs: [todo.id]
    );
  }
}