import 'package:flutter/material.dart';
import 'package:photos/test/swip_picture_test.dart';

class FrostedGlassPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define custom painting logic here
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
