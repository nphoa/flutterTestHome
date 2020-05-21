import 'dart:ui';

import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    String bgImage = data['isDayTime'] ? 'day.jpeg' : 'night.jpg';
    Color backgroundColor = data['isDayTime'] ? Colors.cyan[500]: Colors.indigo[900];
    Color colorFontSize = data['isDayTime'] ? Colors.black87: Colors.white;
    print(data);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: (){
                        Navigator.pop(context);
                    },
                    icon: Icon(
                        Icons.edit_location,
                        color: colorFontSize,
                    ),
                    label:Text(
                        'Edit location to loading',
                      style: TextStyle(color: colorFontSize),
                    ) ,
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                            fontSize: 28.0,
                            letterSpacing: 2.0,
                            color: colorFontSize
                        ),
                      )
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: colorFontSize
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
