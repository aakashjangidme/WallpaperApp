import 'package:flutter/material.dart';
import 'package:wallpaperflutter/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallpaper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,

        // Define the default font family.
        fontFamily: 'Roboto',
//        primaryColor: Colors.white,
      ),
      home: HomeView(),
    );
  }
}
