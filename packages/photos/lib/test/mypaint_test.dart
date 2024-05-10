// import 'dart:ui' as ui;
// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:get/get.dart';
//
// class MyPaintWidget extends StatefulWidget {
//   const MyPaintWidget({super.key});
//
//   @override
//   MyPaintWidgetState createState() => MyPaintWidgetState();
// }
//
// class MyPaintWidgetState extends State<MyPaintWidget> {
//   // 存储绘制路径
//   List<Path> paths = [];
//
//   // 存储绘制颜色
//   Offset? lastOffset;
//
//   // void onPanStart(DragStartDetails details) {
//   //   setState(() {
//   //     line = DrawnLine([point], selectedColor, selectedWidth);
//   //   });
//   // }
//   //
//   // void onPanUpdate(DragUpdateDetails details) {
//   //   final path = List.from(line.path)..add(point);
//   //   setState(() {
//   //     line = DrawnLine(path, selectedColor, selectedWidth);
//   //   });
//   // }
//   //
//   // void onPanEnd(DragEndDetails details) {
//   //   setState(() {
//   //     print('User ended drawing');
//   //   });
//   // }
//   ui.Image? image;
//
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration.zero, () {
//       _loadImage(
//         MediaQuery.sizeOf(context).width.toInt(),
//         MediaQuery.sizeOf(context).height.toInt(),
//       ).then((value) {
//         setState(() {
//           image = value;
//         });
//         print('set image:$image, size:${image?.width}x${image?.height} ');
//         if (image != null) {
//           print('ratio is:${image!.height / image!.width}');
//         }
//       });
//     });
//   }
//
//   Future<ui.Image> _loadImage(int width, int height) async {
//     final data = await rootBundle.load('assets/images/test.webp');
//     final codec = await ui.instantiateImageCodec(
//       data.buffer.asUint8List(),
//       // targetHeight: height,
//       targetWidth: width,
//       allowUpscaling: false,
//     );
//     var frame = await codec.getNextFrame();
//     return frame.image;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onPanStart: (details) {
//         paths.add(Path()
//           ..moveTo(details.localPosition.dx, details.localPosition.dy)
//           ..addRRect(RRect.fromRectAndRadius(
//               Rect.fromCircle(center: details.localPosition, radius: 32),
//               Radius.circular(4))));
//         print('add location:${details.localPosition}');
//         lastOffset = details.localPosition;
//       },
//       onPanUpdate: (details) {
//         setState(() {
//           // 更新绘制路径
//           // points.add(Point(details.localPosition.dx, details.localPosition.dy));
//           // points.add(details.localPosition);
//           // paths.last.lineTo(details.localPosition.dx, details.localPosition.dy);
//           Path last = paths.last;
//           Path newPath = Path.combine(
//               PathOperation.union,
//               last,
//               Path()
//                 ..moveTo(details.localPosition.dx, details.localPosition.dy)
//                 ..addRRect(RRect.fromRectAndRadius(
//                     Rect.fromCircle(center: details.localPosition, radius: 32),
//                     Radius.circular(4))));
//           paths.remove(last);
//           paths.add(newPath);
//           print('add location:${details.localPosition}');
//           lastOffset = details.localPosition;
//         });
//       },
//       onPanEnd: (_) {},
//       child: CustomPaint(
//         painter: MyPainter(image, paths: paths),
//       ),
//     );
//   }
// }
//
// class MyPainter extends CustomPainter {
//   final List<Path> paths;
//   final ui.Image? image;
//
//   MyPainter(this.image, {required this.paths});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     print('paint widget size:${size}, ratio:${size.height / size.width}');
//     Paint paint = Paint()
//       ..color = Colors.transparent // 初始时整体绘制为0.1透明度的黑色
//       ..style = PaintingStyle.fill // 使用 fill 绘制整体背景
//       ..isAntiAlias = true
//       ..strokeCap = StrokeCap.round
//       ..strokeWidth = 20;
//     Path drawPath = Path();
//     for (Path path in paths) {
//       canvas.drawPath(path, paint);
//       drawPath = Path.combine(PathOperation.union, drawPath, path);
//     }
//
//     // 绘制整体背景矩形
//     // canvas.drawRect(Rect.fromLTRB(0, 0, size.width, size.height), paint);
//
//     // // 创建裁剪路径
//     // Path clipPath = Path()..addPolygon(_createPolygonPoints(size), true);
//     //
//     // // 裁剪绘制区域
//     // canvas.clipPath(clipPath);
//
//     // 创建绘制路径
//     // Path path = Path()..moveTo(points.first.dx, points.first.dy);
//     // for (int i = 1; i < points.length; i++) {
//     //   path.lineTo(points[i].dx, points[i].dy);
//     // }
//     // // Path outlinePath = path.
//     //
//     // Paint paint = Paint()
//     //   ..color = Colors.red // 初始时整体绘制为0.1透明度的黑色
//     //   ..style = PaintingStyle.stroke // 使用 fill 绘制整体背景
//     //   ..isAntiAlias = true
//     //   ..strokeWidth = 20;
//     // canvas.drawPath(path, paint);
//     //
//     Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
//     //
//     // // 创建一个新的路径，从矩形中减去原始路径
//     // // Path differencePath = Path()..addRect(rect);
//     Path differencePath = Path.combine(
//       PathOperation.difference,
//       Path()..addRect(rect),
//       drawPath,
//     );
//
//     Paint paintRec = Paint()
//       // ..color = Colors.black.withOpacity(0.9)
//       // ..color = Color(0xa3FFCDD2)
//       // ..color = Colors.yellowAccent
//       // ..blendMode = BlendMode.srcOver
//       // ..shader = LinearGradient(colors: [
//       //   Colors.black,
//       //   Colors.white,
//       // ]).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
//       ..isAntiAlias = true
//       ..strokeWidth = 1
//       // ..maskFilter = MaskFilter.blur(BlurStyle.inner, 4)
//       ..imageFilter = ImageFilter.blur(sigmaX: 10, sigmaY: 10)
//       // ..shader = ui.Gradient.radial(
//       //   Offset(size.width / 2, size.height / 2), // center
//       //   500, // radius
//       //   [Colors.black87, Colors.black], // colors
//       // )
//       ..style = PaintingStyle.stroke;
//     // canvas.drawPath(differencePath, paintRec);
//     // canvas.clipPath(differencePath);
//     // canvas.drawCircle(
//     //   Offset(0, -100),
//     //   10,
//     //   Paint()
//     //     ..blendMode = BlendMode.xor
//     //     // The mask filter gives some fuziness to the cutout.
//     //     ..maskFilter = MaskFilter.blur(BlurStyle.normal, 100),
//     // );
//     if (image != null) {
//       print('draw image.....image size:${image!.width}x${image!.height}');
//       if (!(differencePath.isBlank ?? true)) {
//         canvas.clipPath(differencePath);
//       }
//       // canvas.drawImage(image!, Offset(0, 0),
//       //     Paint()..imageFilter = ImageFilter.blur(sigmaX: 5, sigmaY: 5));
//       if (image == null || image!.width == 0 || image!.height == 0) {
//         return;
//       }
//       final imageWidth = image!.width;
//       final imageHeight = image!.height;
//
//       final screenRatio = size.height / size.width;
//       final imageRatio = imageHeight / imageWidth;
//       print('draw image.....screenRatio:$screenRatio, imageRatio:$imageRatio');
//       if (screenRatio >= imageRatio) {
//         // 需要左右裁剪图片
//         int targetImageWidth = imageHeight ~/ screenRatio;
//         int widthDiff = imageWidth - targetImageWidth;
//         print('targetImageWidth:$targetImageWidth, widthDiff:$widthDiff');
//         canvas.drawImageRect(
//             image!,
//             Rect.fromLTRB(widthDiff.toDouble() / 2, 0,
//                 imageWidth - widthDiff.toDouble() / 2, imageHeight.toDouble()),
//             Rect.fromLTRB(0, 0, size.width, size.height),
//             paintRec);
//       } else {
//         // 需要上下裁剪图片
//         final targetImageHeight = size.height.toInt();
//         final heightDiff = imageHeight - targetImageHeight;
//         canvas.drawImageRect(
//             image!,
//             Rect.fromLTRB(0, heightDiff.toDouble() / 2, imageWidth.toDouble(),
//                 imageHeight.toDouble() - heightDiff.toDouble() / 2),
//             Rect.fromLTRB(0, 0, size.width, size.height),
//             paintRec);
//       }
//     } else {
//       print('image is null!!!!');
//     }
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           width: double.infinity,
//           height: double.infinity,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               // image: ExactAssetImage("assets/images/test.webp"),
//               image: Image.asset('assets/images/test.webp').image,
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: Container(
//             child: MyPaintWidget(),
//           ),
//         ),
//       ),
//     );
//   }
// }
