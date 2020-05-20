import 'package:flutter/material.dart';
import '../services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
 class Loading extends StatefulWidget {
   @override
   _LoadingState createState() => _LoadingState();
 }
 
 class _LoadingState extends State<Loading> {
   
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  }

  void setupWorldTime() async {
     WorldTime instance = WorldTime(location: 'Berlin',flag: 'germany.png',url: 'Europe/Berlin');
     await instance.getTime();
      Navigator.pushReplacementNamed(context, '/home',arguments: {
          'location' : instance.location,
          'flag' :instance.flag,
          'time':instance.time,
          'isDayTime':instance.isDayTime
      });

  }
   @override
   Widget build(BuildContext context) {
     const spinkit = SpinKitPouringHourglass(
       color: Colors.white,
       size: 80.0,
     );
     return Scaffold(
       backgroundColor: Colors.grey[700],
       appBar: AppBar(
         backgroundColor: Colors.blue[900],
         title:Text('Loading'),
       ),
       body: Center(
         child: spinkit,
       )
     );
   }
 }
 