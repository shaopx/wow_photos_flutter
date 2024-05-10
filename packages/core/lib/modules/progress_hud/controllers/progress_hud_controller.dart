// import 'package:core/src/modules/progress_hud/progress_hud.dart';
import 'package:core/modules/progress_hud/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'progress_hud_controller.g.dart';

@riverpod
class ProgressHudController extends _$ProgressHudController {
  @override
  ProgressType build() {
    return ProgressType.loading;
  }

  void setType(ProgressType value) {
    // state = value;
  }
}
