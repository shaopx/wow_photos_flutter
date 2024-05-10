import 'package:flauncher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Launcher extends HookConsumerWidget {
  const Launcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: LauncherBody(),
    );
  }
}

class LauncherBody extends HookConsumerWidget {
  const LauncherBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(
            height: 32,
            width: 32,
          ),
          AppGrid(),
        ],
      ),
    );
  }
}
