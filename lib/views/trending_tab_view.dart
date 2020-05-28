import 'package:flutter/material.dart';
import 'package:flutterapp2/Model/News.dart';
import 'package:flutterapp2/widgets/primary_card.dart';
class TrendingTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: trendingList.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context,index){
            var trending = trendingList[index];
            return InkWell(
              onTap: (){},
              child: Container(
                width: double.infinity,
                height: 300.0,
                margin: EdgeInsets.symmetric(horizontal: 18.0,vertical: 12.0),
                child: PrimaryCard(news: trending,),
              ),
            );
        }
    );
  }
}
