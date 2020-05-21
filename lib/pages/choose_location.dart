import 'package:flutter/material.dart';
import '../services/world_time.dart';
import '../services/data.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
      // getData();
      print('init state');
  }

   void getData() async {
      String  username = await Future.delayed(Duration(seconds: 3),(){
          return 'Handle function after second 3';
      });
//      await Future.delayed(Duration(seconds: 2),(){
//        print('Handle function after second 2');
//      });
      print(username);
   }
  void updateTime(index)  {
      //WorldTime instance = locations[index];
      //await instance.getTime();

//      Navigator.pushNamed(context,'/home',arguments:{
//        'location' : instance.location,
//        'flag' : instance.flag,
//        'time': instance.time,
//        'isDayTime':instance.isDayTime
//      });
          Navigator.pushNamed(context,'/loading',arguments:{
              'index' : index,
          });
  }
  @override
  Widget build(BuildContext context) {
    print('call in build function');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title:Text('Choose location'),
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index)=>
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
              child: Card(
                color: Colors.white30,
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            )
      )
    );
  }
}
