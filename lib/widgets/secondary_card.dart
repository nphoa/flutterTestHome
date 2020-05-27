import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterapp2/Model/News.dart';
import 'package:flutterapp2/constants.dart';
class SecondaryCard extends StatelessWidget {
  final News news;
  SecondaryCard({this.news});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: kGrey3,width: 1.0)
      ),
      child: Row(
        children: <Widget>[
            Container(
              width: 90.0,
              height: 135.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(image: NetworkImage(news.image),fit: BoxFit.cover)
              ),
            ),
          SizedBox(height: 12.0,),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    news.subtitle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: kDetailContent,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}