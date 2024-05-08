import 'dart:typed_data';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image/image.dart' as img;
import 'package:photos/controller/controller.dart';
import 'package:photos/providers/providers.dart';
import 'package:photos/widgets/widgets.dart';

class AlbumGridItem extends HookConsumerWidget {
  const AlbumGridItem({
    required this.imageUrl,
    required this.name,
    required this.date,
    required this.index,
    super.key,
  });
  final String imageUrl;
  final String name;
  final String date;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageFile = ref.watch(imageCacheProvider(imageUrl));
    final coverBlurHash =
        useState(ref.watch(blurHashControllerProvider)[index]);

    return imageFile.when(
      data: (file) => file != null
          ? AlbumGridItemImage(
              file: file,
              name: name,
              date: date,
            )
          : const Text(
              'No Data',
              style: TextStyle(fontSize: 8, color: Colors.white),
            ),
      error: (err, stack) => Text(
        'Error:$err',
        style: const TextStyle(fontSize: 8, color: Colors.white),
      ),
      loading: () => Image.memory(
        Uint8List.fromList(
          img.encodeJpg(BlurHash.decode(coverBlurHash.value).toImage(32, 32)),
        ),
        fit: BoxFit.fill,
      ),
    );
  }
}
