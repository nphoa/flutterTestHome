import 'package:flutter/material.dart';
import 'package:flutterapp2/bottomNav.dart';

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter News',
      debugShowCheckedModeBanner:false ,
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home:BottomNav()
    );
  }
}






