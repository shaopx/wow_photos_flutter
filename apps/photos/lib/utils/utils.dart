import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:photos/photos.dart';

Future<List<Album>> getAlbums() async {
  final jsonString = await rootBundle.loadString('assets/xiuren.json');

  //2.转成List或Map类型
  final jsonMap = json.decode(jsonString) as Map<String, dynamic>;

  final albums = Albums.fromJson(jsonMap);
  for (final album in albums.data) {
    album.host = albums.host;
  }
  return albums.data;
}

String formatUrl(String host, String inputUrl) {
  // Replace "/u/" with "/uploadfile/" and add ".webp" at the end
  final formattedUrl = "${inputUrl.replaceAll("/u/", "/uploadfile/")}.webp";
  return host + formattedUrl;
}
