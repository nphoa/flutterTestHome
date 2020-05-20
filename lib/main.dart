import 'package:flutter/material.dart';
import 'Model/Email.dart';
import 'WorldTime.dart';
void main() {
  runApp(WorldTime());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WorldTime(),
    );
  }
}
class NinjaCard extends StatefulWidget {
  @override
  NinjaCardState createState() => NinjaCardState();
}

class NinjaCardState extends State<NinjaCard> {
  int ninjaLevel = 0;
  List<Email> lstEmail = [
       new Email(email:'hoa.np@gmail.com',color: 'red'),
       new Email(email:'nphoa7777@gmail.com',color: 'grey'),
       new Email(email:'phuochoa7777@gmail.com',color: 'blue'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Ninja ID Card'),
        backgroundColor: Colors.cyan[300],
        centerTitle: true,
      ),
      floatingActionButton:FloatingActionButton(
        onPressed: (){
          setState(() {
            ninjaLevel += 1;
          });
        },
        child:Icon(Icons.add),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/Chunrender.png'),
                radius: 40.0,
              ),
            ),
            Divider(
              height: 60.0,
              color: Colors.deepOrangeAccent[400],
            ),
            Text(
              'NAME',
              style:TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0
              ) ,
            ),
            SizedBox(height: 10.0),
            Text(
              'Chun-Li',
              style:TextStyle(
                  color: Colors.amberAccent,
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight:FontWeight.bold
              ) ,
            ),
            SizedBox(height: 30.0),
            Text(
              'CURRENT NINJA LEVEL',
              style:TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0
              ) ,
            ),
            SizedBox(height: 10.0),
            Text(
              '$ninjaLevel',
              style:TextStyle(
                  color: Colors.amberAccent,
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight:FontWeight.bold
              ) ,
            ),
            SizedBox(height: 30.0),
            Column(
              children: lstEmail.map((email) =>
                  EmailWidget(
                      email: email,
                      onDelete:(){
                        setState(() {
                          lstEmail.remove(email);
                        });
                      }
                  )
              ).toList(),
            ),
          ],
        ) ,
      ),
    );
    throw UnimplementedError();
  }
}

class EmailWidget extends StatelessWidget {
  final Email email;
  final Function onDelete;
  const EmailWidget({
    Key key,
    this.email,
    this.onDelete
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.email,
          color:Colors.grey[400] ,
        ),
        SizedBox(width: 10.0),
        Text(
          '${email.email}',
          style:TextStyle(
            color:Colors.grey[400],
            fontSize: 12.0,
          ) ,
        ),
        FlatButton.icon(
            onPressed: (){
              onDelete();
            },
            color: Colors.cyan[300],
            icon: Icon(Icons.delete),
            label: Text('Delete')
        )
      ],
    );
  }
}



