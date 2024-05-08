import 'dart:math';

import 'package:flutter/material.dart';
import 'package:photos/models/models.dart';
import 'package:photos/widgets/widgets.dart';

class AlbumDetail extends StatelessWidget {
  const AlbumDetail({super.key, required this.album});
  final Album album;

  @override
  Widget build(BuildContext context) {
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
