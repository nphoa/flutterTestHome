import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'Model/Email.dart';
import 'WorldTime.dart';
import './mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


void main() {

  runApp(FlutterMobxApp(title: 'Manage State By Redux'));
}

class FlutterMobxApp extends StatelessWidget {
  final String title;
  FlutterMobxApp({Key key,this.title}):super(key:key);
  @override
  Widget build(BuildContext context) {
    final counter = Counter();
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
                    '${counter.observable.value}',
                    style: const TextStyle(fontSize: 20),
                  );
                },
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            counter.increment();
          },
          child: Text('click'),
      ),
      )

    );
  }
}






