import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterapp2/constants.dart';
import 'package:flutterapp2/views/popular_tab_view.dart';
import 'package:flutterapp2/views/recent_tab_view.dart';
import 'package:flutterapp2/views/trending_tab_view.dart';
class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  'Welcome',
                  textAlign: TextAlign.end,
                  style: kNonActiveTabStyle,
                ),
                subtitle: Text(
                  'NPH',
                  textAlign: TextAlign.end,
                  style: kNonActiveTabStyle,
                ),
                trailing: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage('assets/newsApp/ava.jpg'),
                      fit: BoxFit.cover
                    )
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: kGrey1,
                  unselectedLabelStyle: kNonActiveTabStyle,
                  indicatorSize: TabBarIndicatorSize.label,
                  isScrollable: true,
                  indicatorColor: Colors.white,
                  labelStyle: kActiveTabStyle.copyWith(fontSize: 25.0),
                  tabs: [
                    Tab(text: 'Popular'),
                    Tab(text: 'Trending'),
                    Tab(text: 'Recent')
                  ],
                ),
              )
            ],
          ),
        ) ,
        body: TabBarView(
          children: <Widget>[
            PopularTabView(),
            TrendingTabView(),
            RecentTabView()
          ],
        ),
      ),
    );
  }
}
