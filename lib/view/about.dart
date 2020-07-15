import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
//  PackageInfo packageInfo = PackageInfo();
  String appName = 'WallpaperStore';
  String packageName = 'Unknown';
  String version = '1';
  String buildNumber = 'Unknown';

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appName = packageInfo.appName;
    packageName = packageInfo.packageName;
    version = packageInfo.version;
    buildNumber = packageInfo.buildNumber;
    print(buildNumber); //todo
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('Application Name'),
              subtitle: Text('$appName'),
            ),
            Divider(
              thickness: 1,
            ),
            ListTile(
              title: Text('Version'),
              subtitle: Text('$version'),
            ),
            Divider(
              thickness: 1,
            ),
            ListTile(
              title: Text('Build Number'),
              subtitle: Text('$buildNumber'),
            ),
            Divider(
              thickness: 1,
            ),
            ListTile(
              title: Text('Email'),
              subtitle: Text('ajangid25@gmail.com'),
            ),
            Divider(
              thickness: 1,
            ),
            ListTile(
              title: Text('Copyright'),
              subtitle: Text('Doers Empire Media'),
            ),
            Divider(
              thickness: 1,
            ),
            ListTile(
              title: Text('API'),
              subtitle: Text('Pexels'),
            ),
            Divider(
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
