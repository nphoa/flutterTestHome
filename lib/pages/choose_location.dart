import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    print('call in build function');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title:Text('Choose location'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            FlatButton.icon(
              onPressed: (){
                //Navigator.pushNamed(context, '/');
              },
              icon: Icon(Icons.edit_location),
              label:Text('Edit location') ,
            )
          ],
        ),
      ),
    );
  }
}
