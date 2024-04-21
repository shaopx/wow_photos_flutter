import 'package:flutter/material.dart';
import 'package:wow_photos_flutter/test/swip_picture_test.dart';

class FrostedGlassPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define custom painting logic here
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // body: Stack(
        //   children: [
        //     Image.asset('assets/image.jpg'),
        //     CustomPaint(
        //       painter: FrostedGlassPainter(),
        //     ),
        //   ],
        // ),
        body: FrostedGlassReveal(),
      ),
    );
  }
}
