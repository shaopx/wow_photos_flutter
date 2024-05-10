import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photos/photos.dart';

class AlbumHomePage extends HookConsumerWidget {
  const AlbumHomePage({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 17),
        ),
      ),
      body: const AlbumGridView(),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Refresh',
        onPressed: () {
          ref.invalidate(albumDataControllerProvider);
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
