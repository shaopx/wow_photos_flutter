import 'package:flauncher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppGrid extends HookConsumerWidget {
  const AppGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      shrinkWrap: true,
      itemCount: 9,
      itemBuilder: (context, index) {
        return switch (index) {
          0 || 1 || 2 || 3 || 4 => AppCard(index: index),
          _ => Container(),
        };
      },
    );
  }
}
