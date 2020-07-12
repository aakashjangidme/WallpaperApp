import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wallpaperflutter/data/data.dart';
import 'package:wallpaperflutter/view/search_view.dart';
import 'package:wallpaperflutter/view/settings_view.dart';
import 'package:wallpaperflutter/widget/categories_tile.dart';
import 'package:wallpaperflutter/widget/widget.dart';

import 'models/categories_model.dart';
import 'services/networking.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<CategoriesModel> categories = new List();

  TextEditingController searchController = new TextEditingController();

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories(); //init the get categories
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Air it',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchView(),
                ),
              );
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  left: 24,
                ),
                child: Text('Categories',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 16,
              ),
//              SizedBox(
//                height: 16,
//              ),
              Container(
                height: 80,
                child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    itemCount: categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      /// Create List Item tile
                      return CategoriesTile(
                        imgUrls: categories[index].imgUrl,
                        category: categories[index].categoryName,
                      );
                    }),
              ),
              wallPaper(getCuratedImages()),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Photos provided By ",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                        fontFamily: 'Overpass'),
                  ),
                  GestureDetector(
                    onTap: () {
                      _launchURL("https://www.pexels.com/");
                    },
                    child: Container(
                        child: Text(
                      "Pexels",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          fontFamily: 'Overpass'),
                    )),
                  )
                ],
              ),
              SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: brandName(),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.black87,
              ),
              title: Text(
                'Home',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeView()));
//                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.black87,
              ),
              title: Text(
                'Settings',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsView()));
              },
            ),
            Divider(
              thickness: 1,
            ),
            ListTile(
              leading: Icon(
                Icons.share,
                color: Colors.black87,
              ),
              title: Text(
                'Share',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                //TODO
              },
            ),
            ListTile(
              leading: Icon(
                Icons.rate_review,
                color: Colors.black87,
              ),
              title: Text(
                'Rate',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                //TODO
              },
            ),
            ListTile(
              leading: Icon(
                Icons.contact_mail,
                color: Colors.black87,
              ),
              title: Text(
                'Contact Us',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                //TODO
              },
            ),
            ListTile(
              leading: Icon(
                Icons.update,
                color: Colors.black87,
              ),
              title: Text(
                'Check for Updates',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                //TODO
              },
            ),
            ListTile(
              leading: Icon(
                Icons.lock,
                color: Colors.black87,
              ),
              title: Text(
                'Privacy Policy',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                //TODO
              },
            ),
            Divider(
              thickness: 1,
            ),

            //made by
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Made By ",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                        fontFamily: 'Overpass'),
                  ),
                  GestureDetector(
                    onTap: () {
                      _launchURL("https://www.linkedin.com/in/aakashjangidme/");
                    },
                    child: Container(
                        child: Text(
                      "Aakash Jangid",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                          fontFamily: 'Overpass'),
                    )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
