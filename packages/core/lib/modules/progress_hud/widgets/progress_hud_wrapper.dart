// import 'package:aries/aries.dart';
// import 'package:core/src/modules/progress_hud/progress_hud.dart';
import 'package:core/modules/modules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Allows the [child] to display the ProgressHUD
class ProgressHUDWrapper extends HookConsumerWidget {
  const ProgressHUDWrapper({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progressType = ref.watch(progressHudControllerProvider);

    return ProgressHUD(
      indicatorWidget: progressType.icon,
      padding: const EdgeInsets.fromLTRB(32, 24, 32, 16),
      borderColor: Colors.transparent,
      backgroundColor: progressType.backgroundColor,
      barrierEnabled: progressType.barrierEnabled,
      barrierColor: Colors.black54,
      // textStyle:
      //     context.textTheme.titleSmall!.copyWith(color: AriesColor.neutralB100),
      child: child,
    );
  }
}
