import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/flutter_widgets.dart';

void main() {
  debugPrintGestureArenaDiagnostics = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            Center(
              child: SizedBox(
                width: 200,
                height: 420,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 1)),
                  child: BlurryGlassPaneWidget(
                    // image: Image.asset("assets/images/test.webp"),
                    image: Image.network(
                        "https://www.123781.xyz/uploadfile/202404/17/28144654410.webp"),
                  ),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: 200,
                height: 420,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 1)),
                  child: BlurryGlassPaneWidget(
                    // image: Image.asset("assets/images/test.webp"),
                    image: Image.network(
                        "https://www.123781.xyz/uploadfile/202404/17/DA144654152.webp"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
