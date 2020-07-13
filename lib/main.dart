import 'package:flutter/material.dart';
import 'package:wallpaperflutter/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallpaper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        primarySwatch: Colors.purple,

        // Define the default font family.
        fontFamily: 'Roboto',
      ),
      home: HomeView(),
    );
  }
}
