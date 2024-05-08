import 'dart:io';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
Future<File?> imageCache(ImageCacheRef ref, String imageUrl) async {
  return DefaultCacheManager().getSingleFile(imageUrl);
}
