import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photos/controller/album_data_controller.dart';
import 'package:photos/utils/utils.dart';
import 'package:photos/widgets/widgets.dart';

class AlbumGridView extends HookConsumerWidget {
  const AlbumGridView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagesData = ref.watch(albumDataControllerProvider);
    return imagesData.when(
      data: (images) => ColoredBox(
        color: Colors.black,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 9 / 16,
          ),
          itemCount: 9,
          itemBuilder: (context, index) {
            if (index < images.length) {
              // return GridCover(album: _images[index]);
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<Widget>(
                      builder: (context) => AlbumDetail(album: images[index]),
                    ),
                  );
                },
                child: AlbumGridItem(
                  imageUrl:
                      formatUrl(images[index].host, images[index].images[0]),
                  name: images[index].name,
                  date: images[index].date,
                  index: index,
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
      error: (err, stack) => Text('有异常发生了. $err, $stack'),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
