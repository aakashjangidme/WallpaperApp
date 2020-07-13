import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wallpaperflutter/view/image_view.dart';

import '../models/data_model.dart';
import 'progress_indicator_circular.dart';

Widget wallPaper(context) {
  return Container(
//    height: 700,
    child: FutureBuilder(
      future: context,
      builder: (BuildContext context, AsyncSnapshot<PhotoList> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Container(
            height: MediaQuery.of(context).size.height * 0.80,
            child: Center(
              child: ProgressIndicatorDemo(
                type: ProgressIndicatorDemoType.circular,
              ),
            ),
          );
        else if (snapshot.data != null)
          return StaggeredGridView.countBuilder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            crossAxisCount: 4,
            itemCount: snapshot.data.photos.length,
            itemBuilder: (BuildContext context, int index) {
              var data = snapshot.data.photos[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ImageView(imgPath: data.src.portrait),
                    ),
                  );
                },
                child: Hero(
                  tag: data.src.small,
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.75,
                    width: MediaQuery.of(context).size.width * 0.50,
                    margin: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          data.src.small,
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              );
            },
            staggeredTileBuilder: (int index) =>
                new StaggeredTile.count(2, index.isEven ? 3 : 1.5),
            mainAxisSpacing: 2.0,
            crossAxisSpacing: 2.0,
          );
        else if (snapshot.data == null) {
          return Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Center(
                child: ProgressIndicatorDemo(
              type: ProgressIndicatorDemoType.circular,
            )),
          );
        }

        return Container(
          child: Center(child: Text('Null')),
        );
      },
    ),
  );
}

Widget brandName() {
  return Row(
//    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        "Wallpaper",
        style: TextStyle(
            color: Colors.black87, fontFamily: 'Overpass', fontSize: 24),
      ),
      Text(
        "Store",
        style: TextStyle(
            color: Colors.deepPurple, fontFamily: 'Overpass', fontSize: 24),
      )
    ],
  );
}
