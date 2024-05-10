import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum AppEntry {
  photos('PHOTOS'),
  videos('Videos'),
  pretty('GIRLS'),
  english('English'),
  news('News');

  const AppEntry(this.value);

  final String value;
}

extension AppEntryX on AppEntry {
  String labelOf(int index) => AppEntry.values[index].value;
}

class AppCard extends HookConsumerWidget {
  const AppCard({required this.index, super.key});

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color withColor(int index) {
      return switch (index) {
        0 => Colors.lightGreen,
        1 => Colors.cyan,
        2 => Colors.deepOrangeAccent,
        3 => Colors.pinkAccent,
        _ => Colors.amberAccent
      };
    }

    VoidCallback withTapCallback(int index) {
      return switch (index) {
        0 => () {
            context.go('/photos');
          },
        1 => () {},
        2 => () {},
        3 => () {},
        _ => () {},
      };
    }

    return SizedBox(
      height: 100,
      width: 100,
      child: Material(
        color: withColor(index),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        child: InkWell(
          onTap: withTapCallback(index),
          borderRadius: BorderRadius.circular(32),
          splashColor: Colors.blueAccent,
          // highlightColor: Colors.blueAccent.withOpacity(0.5),
          child: Center(
            child: Text(
              AppEntry.values[index % AppEntry.values.length].value,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
