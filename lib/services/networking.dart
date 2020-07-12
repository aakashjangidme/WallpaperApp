import 'package:http/http.dart';

import '../models/data_model.dart';

const String apiKEY =
    "563492ad6f91700001000001f3da63836d2e4ce3a37dad119cd60bc7"; //add 7
const String apiUrl = 'https://api.pexels.com/v1/curated?per_page=15&page=2';

Future<PhotoList> getCuratedImages() async {
  print('Calling uri: $apiUrl');
  final response = await get(
      'https://api.pexels.com/v1/search?query=Amoled%20wallpaper%20black%20dark&per_page=30&page=1',
      headers: {'Authorization': apiKEY});
  if (response.statusCode == 200) {
    return photoListFromJson(response.body);
  } else
    return null;
}

Future<PhotoList> getSearchImages(String searchQuery) async {
  print('Calling uri: $apiUrl');
  final response = await get(
      'https://api.pexels.com/v1/search?query=$searchQuery&per_page=50&page=1',
      headers: {'Authorization': apiKEY});
  if (response.statusCode == 200) {
    return photoListFromJson(response.body);
  } else
    return null;
}

Future<PhotoList> getCategoriesImages(String category) async {
  print('Calling uri: $apiUrl');
  final response = await get(
      "https://api.pexels.com/v1/search?query=$category&per_page=30&page=1",
      headers: {'Authorization': apiKEY});
  if (response.statusCode == 200) {
    return photoListFromJson(response.body);
  } else
    return null;
}
