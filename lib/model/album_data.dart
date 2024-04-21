import 'package:wow_photos_flutter/model/models.dart';
import 'package:wow_photos_flutter/utils/utils.dart';

class AlbumsData {
  factory AlbumsData() {
    _instance ??= AlbumsData._internal();
    return _instance!;
  }
  AlbumsData._internal();
  static AlbumsData? _instance;

  List<Album> data = [];

  Future<List<Album>> getData() async {
    if (data.isEmpty) {
      await fetchData();
    }
    return data;
  }

  Future<void> fetchData() async {
    await getAlbums().then((list) {
      data.addAll(list);
    });
  }
}
