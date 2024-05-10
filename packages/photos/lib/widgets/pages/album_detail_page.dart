import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photos/controller/controller.dart';
import 'package:photos/widgets/widgets.dart';

class AlbumDetail extends HookConsumerWidget {
  const AlbumDetail({required this.index, super.key});

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageList = ref.watch(albumDataControllerProvider).value;
    if (imageList == null) {
      return Offstage();
    }
    final album = imageList[index];
    return Scaffold(
      body: ColoredBox(
        color: Colors.black,
        child: PageView.builder(
          // physics: const NeverScrollableScrollPhysics(),
          itemCount: album.images.length,
          itemBuilder: (context, index) {
            return AlbumPageviewItem(
              album: album,
              index: index,
            );
          },
        ),
      ),
    );
  }
}

extension NonEmptyListStringX on List<String> {
  String get randomValue {
    if (isEmpty) {
      throw Exception('can not support empty list');
    }
    return this[Random().nextInt(length)];
  }
}
