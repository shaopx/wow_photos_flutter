import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_widgets/blurry_glass_pane.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AlbumGridItemImage extends HookConsumerWidget {
  const AlbumGridItemImage({
    required this.file,
    required this.name,
    required this.date,
    super.key,
  });

  final File file;
  final String name;
  final String date;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardWidth = MediaQuery.of(context).size.width / 3;
    final cardHeight = cardWidth * 16 / 9;

    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      color: Colors.black54,
      child: Stack(
        children: [
          // Load the first image from the images list
          Padding(
            padding: EdgeInsets.zero,
            child: SizedBox(
              width: cardWidth,
              height: cardHeight,
              child: BlurryGlassPaneWidget(
                image: Image.file(
                  file,
                  fit: BoxFit.cover,
                ),
                blurLevel: 2,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.center,
                stops: const [0.0, 0.1, 0.5], // 设置渐变的起始和结束点
                colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 6,
              bottom: 2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 10, color: Colors.white),
                ),
                const SizedBox(height: 0),
                Text(
                  date,
                  style: const TextStyle(fontSize: 8, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
