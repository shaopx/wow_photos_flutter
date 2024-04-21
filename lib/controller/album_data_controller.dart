import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wow_photos_flutter/model/album_data.dart';
import 'package:wow_photos_flutter/model/models.dart';

part 'album_data_controller.g.dart';

@riverpod
class AlbumDataController extends _$AlbumDataController {
  @override
  Future<List<Album>> build() async {
    final albums = await AlbumsData().getData();
    albums.shuffle();
    return albums;
  }

  // Future<void> addBlurHash(String blurhash) async {
  //   state = const AsyncLoading();
  //   state = await AsyncValue.guard(() async {
  //     final SharedPreferences prefs = await SharedPreferences.getInstance();
  //     final blurhashs = await prefs.getStringList(sharedPreferenceTag) ?? [];
  //     if (!blurhashs.contains(blurhash)) blurhashs.add(blurhash);
  //     await prefs.setStringList(sharedPreferenceTag, blurhashs);
  //     return blurhashs;
  //   });
  // }
}
