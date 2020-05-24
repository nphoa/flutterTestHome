import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'Model/Email.dart';
import 'WorldTime.dart';
import './mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'TodoApp.dart';
import 'mobxV2.dart';


void main() {

  runApp(TodoApp());
}

class FlutterMobxApp extends StatelessWidget {
  final String title;
  FlutterMobxApp({Key key,this.title}):super(key:key);
  @override
  Widget build(BuildContext context) {
    final contact = Contact();
    return MaterialApp(
      //theme: ThemeData.dark(),
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mobx Manage State'),
          centerTitle: true,
        ),
        body:Center(
          child: Column(
            children: <Widget>[
              Observer(
                builder: (_){
                  return Text(
                    '${contact.fullName}',
                    style: const TextStyle(fontSize: 20),
                  );
                },
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
              contact.addName('nguyen', 'hoa');
          },
          child: Text('click'),
      ),
      )

    );
  }
}






