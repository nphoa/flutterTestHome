import 'package:flutter/material.dart';
import 'package:flutterapp2/Model/News.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:universal_html/parsing.dart';
import 'package:xml/xml.dart' as xml;
import 'package:xml/xml_events.dart' as xml_events;
import 'package:universal_html/html.dart';
import 'package:http/http.dart' as client;
import 'dart:convert' show utf8;
import 'dart:convert';

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

    items.forEach((node) async {
      News news = News();
      news.category = 'Demo';
      String title = utf8convert(node.findElements('title').map((e) =>e.text).toString()).replaceAll( "(", '').replaceAll(")", '');
      news.title = title;
      final htmlDocument = parseHtmlDocument(node.findElements('description').toString());
      String img = 'https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png';
      if( htmlDocument.querySelector('img') != null){
         img = htmlDocument.querySelector('img').attributes['src'];
         if(img.contains('gif') != false){img = 'https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png';}
      }
      news.image = img;
      String subtitle = utf8convert(htmlDocument.querySelector('description').text).replaceAll( "]]>", '');
      news.subtitle = subtitle;

      String date =   node.findElements('pubDate').map((e) =>e.text).toString().replaceAll( "(", '').replaceAll(")", '');
      news.time = date;

      String contentHTML = node.findElements('link').map((e) => e.text).toString().replaceAll( "(", '').replaceAll(")", '');
      Response html = await client.get(contentHTML);
      final xmlDocument = parseHtmlDocument(html.body.toString());

      String content = '';
      final htmlDom = xmlDocument.querySelectorAll('article.fck_detail');
      if(htmlDom.length > 0){
        for(var i = 0;i<htmlDom.length;i++ ){
            content += htmlDom[i].text;
        }
      }else{
        content = 'No content';
      }
      print(content);
      news.content = content;

      newsList.add(news);

      //ssprint(news.image);
    });
    print(newsList[0].content);
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