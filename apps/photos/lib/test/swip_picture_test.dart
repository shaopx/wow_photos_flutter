import 'package:flutter/material.dart';
import 'dart:ui';

class FrostedGlassReveal extends StatefulWidget {
  @override
  _FrostedGlassRevealState createState() => _FrostedGlassRevealState();
}

class _FrostedGlassRevealState extends State<FrostedGlassReveal> {
  List<Offset> swipePath = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          swipePath.add(details.localPosition);
        });
      },
      // child: Stack(
      //   children: [
      //     // Frosted glass image
      //     BackdropFilter(
      //       filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      //       child: Container(
      //         decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
      //         child: Image.asset('assets/images/test.webp'),
      //       ),
      //     ),
      //
      //     // Custom painter to reveal clear image segments
      //     // CustomPaint(
      //     //   painter: RevealPainter(swipePath: swipePath),
      //     // ),
      //   ],
      // ),
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage("assets/images/test.webp"),
            fit: BoxFit.cover,
          ),
        ),
        // child: ClipRRect(
        // make sure we apply clip it properly
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          // child: Container(
          //   alignment: Alignment.center,
          //   color: Colors.grey.withOpacity(0.0),
          //   child: Text(
          //     "GFG COURSES",
          //     style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          //   ),
          // ),
          child: Text('adsfasdfasdf'),
          // child: Image.asset(
          //   'assets/images/test.webp',
          //   fit: BoxFit.cover,
          // ),
        ),
        // ),
      ),
    );
  }
}

class RevealPainter extends CustomPainter {
  final List<Offset> swipePath;

  RevealPainter({required this.swipePath});

  @override
  void paint(Canvas canvas, Size size) {
    // Create transparent rectangles corresponding to swipe path
    for (Offset point in swipePath) {
      Rect rect = Rect.fromCenter(center: point, width: 50, height: 50);
      Paint paint = Paint()..color = Colors.transparent;
      canvas.drawRect(rect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
