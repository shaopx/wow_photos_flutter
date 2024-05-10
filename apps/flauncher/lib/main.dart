import 'package:flauncher/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photos/photos.dart';

class CustomCacheManager {
  static const key = 'customCacheKey';
  static CacheManager instance = CacheManager(
    Config(
      key,
      stalePeriod: const Duration(days: 2),
      maxNrOfCacheObjects: 1000,
      // repo: JsonCacheInfoRepository(databaseName: key),
      // fileSystem: IOFileSystem(key),
      fileService: HttpFileService(),
    ),
  );
}

void main() {
  debugPrintGestureArenaDiagnostics = true;
  runApp(const ProviderScope(child: MyApp()));
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Launcher(),
    ),
    GoRoute(
      path: '/photos',
      builder: (context, state) => const AlbumHomePage(
        title: 'Photos',
      ),
      // routes: [
      //   GoRoute(
      //     path: 'details',
      //     builder: (context, state) {
      //       return AlbumDetail(index: ,);
      //     },
      //   ),
      // ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
    // return MaterialApp(
    //   title: '万花筒',
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //     useMaterial3: true,
    //   ),
    //   home: const Launcher(),
    // );
  }
}
