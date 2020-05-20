import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/loading.dart';
import 'pages/choose_location.dart';
class WorldTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'World time app',
      initialRoute: '/location',
      routes: {
         '/'        : (context) => Loading(),
        '/home'     : (context) => Home(),
        '/location' : (context) => ChooseLocation()
      },
    );
  }
}
