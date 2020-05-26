import 'package:flutter/material.dart';
import 'package:flutterapp2/db/todo_database.dart';
import 'WorldTime.dart';
import 'TodoApp.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await TodoDatabse.instance.int();
  runApp(TodoApp());
}








