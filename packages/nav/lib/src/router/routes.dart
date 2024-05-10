import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:photos/photos.dart' as photos;
import 'package:photos/photos.dart';

part 'routes.g.dart';

/* Emp */

final empShellKey = GlobalKey<NavigatorState>(debugLabel: 'empShell');
final rootKey = GlobalKey<NavigatorState>(debugLabel: 'root');

@TypedGoRoute<PhotosHomeRoute>(path: '/', routes: [
  TypedGoRoute<AlbumDetailRoute>(
    path: 'album-detail',
  )
])
@immutable
class PhotosHomeRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AlbumHomePage(
      title: 'photos home',
    );
  }
}

@immutable
class AlbumDetailRoute extends GoRouteData {
  const AlbumDetailRoute(this.album);

  final Album album;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return AlbumDetail(
      album: album,
    );
  }
}

final _router = GoRouter(
  routes: [
    // GoRoute(
    //   path: '/',
    //   builder: (context, state) => const Launcher(),
    // ),
    GoRoute(
      path: '/',
      builder: (context, state) => const AlbumHomePage(
        title: 'Photos',
      ),
    ),
  ],
);

class EmpPostJobRoute extends GoRouteData {
  const EmpPostJobRoute({
    this.draftId,
  });

  final String? draftId;
  static const path = 'post-job';
  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ProgressHUDWrapper(
      child: photos.AlbumHomePage(
        title: 'Photos',
      ),
    );
  }
}
