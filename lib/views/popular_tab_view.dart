import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterapp2/Model/News.dart';
import 'package:flutterapp2/constants.dart';
import 'package:flutterapp2/services/news_services.dart';
import 'package:flutterapp2/views/read_news_view.dart';
import 'package:flutterapp2/widgets/primary_card.dart';
import 'package:flutterapp2/widgets/secondary_card.dart';
class PopularTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NewsServices.getInstance().getDataXMLByRssLink();
    final popularList = NewsServices.getInstance().newsList;
    final popularListLimit = popularList.take(5).toList();
    final recentListLimit = popularList.skip(5).toList();
    return Container(
      child: ListView(
        children:<Widget> [
          Container(
            width: double.infinity,
            height: 300.9,
            padding: EdgeInsets.only(left: 18.0),
            child: ListView.builder(
                itemCount: popularListLimit.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context,index){
                    var news = popularListLimit[index];
                    return InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReadNewsView(news: news,)
                          )
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 12.0),
                        child: PrimaryCard(news: news),
                      ),
                    );
                },
            ),
          ),
          SizedBox(height: 25.0,),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 19.0),
              child: Text('BASED ON YOUR RAEADING HISTORY',style: kNonActiveTabStyle,),
            ),
          ),
          ListView.builder(
            itemCount: recentListLimit.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (context,index){
                var recent = recentListLimit[index];
                return InkWell(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReadNewsView(news: recent,)
                        )
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 135.0,
                    margin: EdgeInsets.symmetric(horizontal: 18.0,vertical: 8.0),
                    child: SecondaryCard(news: recent,),
                  ),
                );
              }
          )
        ],
      ),
    );
  }
}
