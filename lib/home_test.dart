import 'package:flutter/material.dart';
import 'package:wallpaperflutter/services/networking.dart';
import 'package:wallpaperflutter/widget/widget.dart';

class HomeTest extends StatefulWidget {
  @override
  _HomeTestState createState() => _HomeTestState();
}

class _HomeTestState extends State<HomeTest> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: brandName(),
          elevation: 0,
          backgroundColor: Colors.white,
          bottom: TabBar(
            isScrollable: false,
            tabs: <Widget>[
              Tab(
                text: 'Wallpaper',
              ),
              Tab(
                text: 'Categories',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            //walls
            wallPaper(getCuratedImages()),

            //cats
            Text('Hey'),
          ],
        ),
      ),
    );
  }
}
