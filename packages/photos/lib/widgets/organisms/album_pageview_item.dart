import 'dart:typed_data';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_widgets/flutter_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image/image.dart' as img;
import 'package:photos/controller/blur_hash_controller.dart';
import 'package:photos/models/models.dart';
import 'package:photos/providers/providers.dart';
import 'package:photos/utils/utils.dart';
import 'package:photos/widgets/widgets.dart';

class AlbumPageviewItem extends HookConsumerWidget {
  const AlbumPageviewItem({
    required this.album,
    required this.index,
    super.key,
  });

  final Album album;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coverFile = ref
        .watch(imageCacheProvider(formatUrl(album.host, album.images[0])))
        .valueOrNull;
    final itemImageFile = ref
        .watch(imageCacheProvider(formatUrl(album.host, album.images[index])));
    final coverBlurHash =
        useState(ref.watch(blurHashControllerProvider).randomValue);

    if (coverFile == null) {
      return itemImageFile.when(
        data: (file) => file != null
            ? BlurryGlassPaneWidget(
                image: Image.file(
                  file,
                  fit: BoxFit.cover,
                ),
                canWipe: true,
              )
            : const Text(
                'No Data',
                style: TextStyle(fontSize: 8, color: Colors.white),
              ),
        error: (err, stack) => Text(
          'Error$err',
          style: const TextStyle(fontSize: 8, color: Colors.white),
        ),
        loading: () => Image.memory(
          Uint8List.fromList(
            img.encodeJpg(BlurHash.decode(coverBlurHash.value).toImage(32, 32)),
          ),
          fit: BoxFit.fill,
        ),
      );
    } else {
      return itemImageFile.when(
        data: (file) => file != null
            ? BlurryGlassPaneWidget(
                image: Image.file(
                  file,
                  fit: BoxFit.cover,
                ),
                canWipe: true,
              )
            : const Text(
                'No Data',
                style: TextStyle(fontSize: 8, color: Colors.white),
              ),
        error: (err, stack) => Text(
          'Error$err',
          style: const TextStyle(fontSize: 8, color: Colors.white),
        ),
        loading: () => Stack(
          children: [
            BlurryGlassPaneWidget(
              image: Image.file(
                coverFile,
                fit: BoxFit.cover,
              ),
              blurLevel: 30,
            ),
            const Center(
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      );
    }
  }
}
