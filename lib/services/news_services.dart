import 'package:flutter/material.dart';
import 'package:flutterapp2/Model/News.dart';
import 'package:universal_html/parsing.dart';
import 'package:xml/xml.dart' as xml;
import 'package:xml/xml_events.dart' as xml_events;
import 'package:universal_html/html.dart';
import 'package:http/http.dart' as client;
import 'dart:convert' show utf8;

class NewsServices{
  static NewsServices instance;
  NewsServices._internal();
  final List<News> newsList = new List<News>();
  static NewsServices getInstance(){
    if(instance == null){
      instance = NewsServices._internal();
    }
    return instance;
  }
  static String utf8convert(String text) {
    List<int> bytes = text.toString().codeUnits;
    return utf8.decode(bytes);
  }
  Future<void> getDataXMLByRssLink() async{

    String  latest_news_rss = await  client.read('https://vnexpress.net/rss/tin-moi-nhat.rss');
    final latest_news_xml = xml.parse(latest_news_rss);
    final items = latest_news_xml.findAllElements('item');

    items.forEach((node) {
      News news = News();
      String title = utf8convert(node.findElements('title').map((e) =>e.text).toString()).replaceAll( "(", '').replaceAll(")", '');
      news.title = title;
      final htmlDocument = parseHtmlDocument(node.findElements('description').toString());
      String img = '';
      if( htmlDocument.querySelector('img') != null){
         img = htmlDocument.querySelector('img').attributes['src'];
      }
      news.image = img;
      String subtitle = utf8convert(htmlDocument.querySelector('description').text).replaceAll( "]]>", '');
      news.subtitle = subtitle;

      newsList.add(news);

      //print(title);
    });
    print(newsList.length);
    //print(utf8convert(test[0]).replaceAll( "(", '').replaceAll(")", ''));
//    Response html = await get('https://vnexpress.net/bao-viet-ra-mat-chuong-trinh-bao-hiem-du-lieu-cho-doanh-nghiep-4105797.html');
//    final xmlDocument = parseHtmlDocument(html.body.toString());
//      print(xmlDocument.querySelectorAll('article.fck_detail > p.Normal').length);
//    for(var i = 0;i<xmlDocument.querySelectorAll('article.fck_detail').length;i++ ){
//      print(xmlDocument.querySelectorAll('article.fck_detail')[i].text);
//    }
  //return newsList;
  }
}