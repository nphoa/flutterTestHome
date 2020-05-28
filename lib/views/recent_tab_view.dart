import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp2/Model/News.dart';
import 'package:flutterapp2/widgets/secondary_card.dart';
class RecentTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: recentList.length,
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context,index){
          var recent = recentList[index];
          return InkWell(
              onTap: (){},
              child: Container(
                width: double.infinity,
                height: 135.0,
                margin: EdgeInsets.symmetric(horizontal: 18.0,vertical: 8.0),
                child: SecondaryCard(news: recent,),
              ),
          );
        },
    );
  }
}
