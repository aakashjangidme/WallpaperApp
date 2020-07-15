import 'package:flutter/material.dart';
import 'package:wallpaperflutter/services/networking.dart';
import 'package:wallpaperflutter/widget/widget.dart';

class CategoriesScreen extends StatefulWidget {
  final String category;

  CategoriesScreen({@required this.category});

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
        actions: <Widget>[
          Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: wallPaper(getCategoriesImages(widget.category)),
      ),
    );
  }
}
