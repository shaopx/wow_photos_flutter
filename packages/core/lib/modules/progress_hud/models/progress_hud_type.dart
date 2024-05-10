import 'package:flutter/material.dart';

enum ProgressType { loading, success, error }

extension ProgressTypeExtension on ProgressType {
  Color get backgroundColor {
    const loadingColor = Colors.grey;
    return loadingColor;
    // switch (this) {
    //   case ProgressType.loading:
    //     return loadingColor;
    //   case ProgressType.success:
    //     return AriesColor.green;
    //   case ProgressType.error:
    //     return AriesColor.mutedred;
    // }
  }

  /// If [barrierEnabled] is true, touches on the page will be disabled while
  /// the ProgressHUD is shown.
  bool get barrierEnabled {
    switch (this) {
      case ProgressType.loading:
        return true;
      case ProgressType.success:
      case ProgressType.error:
        return false;
    }
  }

  Widget get icon {
    const loadingIndicator = SizedBox(
      width: 40,
      height: 40,
      child: CircularProgressIndicator(
        strokeWidth: 3,
        valueColor: AlwaysStoppedAnimation(Colors.pink),
      ),
    );
    return loadingIndicator;
    // switch (this) {
    //   case ProgressType.loading:
    //     return loadingIndicator;
    // case ProgressType.success:
    //   return SvgPicture.asset(
    //     AriesIcon.checkboxCircleFill,
    //     width: 40,
    //     height: 40,
    //     colorFilter:
    //         const ColorFilter.mode(AriesColor.neutralB100, BlendMode.srcIn),
    //   );
    // case ProgressType.error:
    //   return SvgPicture.asset(
    //     AriesIcon.closeCircleFill,
    //     width: 40,
    //     height: 40,
    //     colorFilter:
    //         const ColorFilter.mode(AriesColor.neutralB100, BlendMode.srcIn),
    //   );
    // }
  }

  String get text {
    switch (this) {
      case ProgressType.loading:
        return 'loading';
      case ProgressType.success:
        return 'success';
      case ProgressType.error:
        return 'error';
    }
  }
}
