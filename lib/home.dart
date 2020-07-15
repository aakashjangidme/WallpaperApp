import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wallpaperflutter/data/data.dart';
import 'package:wallpaperflutter/services/ad_manager.dart';
import 'package:wallpaperflutter/view/privacy_policy.dart';
import 'package:wallpaperflutter/view/search_view.dart';
import 'package:wallpaperflutter/view/settings_view.dart';
import 'package:wallpaperflutter/widget/categories_tile.dart';
import 'package:wallpaperflutter/widget/widget.dart';

import 'models/categories_model.dart';
import 'services/networking.dart';

const kTextStyleDrawer =
    TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black54);

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<CategoriesModel> categories = new List();

  TextEditingController searchController = new TextEditingController();
  BannerAd _bannerAd;

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _initAdMob() {
    return FirebaseAdMob.instance.initialize(appId: AdManager.appId);
  }

  // TODO: Implement _loadBannerAd()
  void _loadBannerAd() {
    _bannerAd
      ..load()
      ..show(anchorType: AnchorType.bottom);
  }

  @override
  void initState() {
    super.initState();
    categories = getCategories(); //init the get categories

    _bannerAd = BannerAd(
      adUnitId: AdManager.bannerAdUnitId,
      size: AdSize.banner,
    );

    _initAdMob();
    // TODO: Load a Banner Ad
    _loadBannerAd();
  }

  @override
  void dispose() {
    // TODO: Dispose BannerAd object
    _bannerAd?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
          bottom: TabBar(
            isScrollable: false,
            tabs: <Widget>[
              Tab(
//                text: 'Wallpaper',
                child: Text(
                  'Wallpaper',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              Tab(
//                text: 'Categories',
                child: Text(
                  'Categories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: TabBarView(
          children: <Widget>[
            //walls
            wallPaper(getCuratedImages()),

            //cats
            GridView.builder(
                physics: ClampingScrollPhysics(),
//                padding: EdgeInsets.symmetric(horizontal: 8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: categories.length,
                shrinkWrap: true,
//                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return CategoriesTile(
                    imgUrls: categories[index].imgUrl,
                    category: categories[index].categoryName,
                  );
                }),
          ],
        ),
        drawer: Drawer(
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
                  style: kTextStyleDrawer,
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
                  style: kTextStyleDrawer,
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
                  style: kTextStyleDrawer,
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
                  style: kTextStyleDrawer,
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
                  style: kTextStyleDrawer,
                ),
                onTap: () {
                  _launchURL("https://www.linkedin.com/in/aakashjangidme/");
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.update,
                  color: Colors.black87,
                ),
                title: Text(
                  'Check for Updates',
                  style: kTextStyleDrawer,
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
                  style: kTextStyleDrawer,
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PrivacyPolicy()));
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
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Raleway'),
                    ),
                    GestureDetector(
                      onTap: () {
                        _launchURL(
                            "https://www.linkedin.com/in/aakashjangidme/");
                      },
                      child: Container(
                          child: Text(
                        "Aakash Jangid",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Raleway'),
                      )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
