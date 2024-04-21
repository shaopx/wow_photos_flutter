import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/material.dart';

class BlurryGlassPaneWidget extends StatefulWidget {
  const BlurryGlassPaneWidget({
    required this.image,
    this.canWipe = false,
    this.blurLevel = 4,
    super.key,
  });
  final Image image;
  final bool canWipe;
  final double blurLevel;
  @override
  BlurryGlassPaneWidgetState createState() => BlurryGlassPaneWidgetState();
}

class BlurryGlassPaneWidgetState extends State<BlurryGlassPaneWidget> {
  List<Offset> swipePath = [];
  List<Path> paths = [];

  ImageStream? _imageStream;
  ImageInfo? _imageInfo;
  final rectRadius = const Radius.circular(4);
  final pathRadius = 32.0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getImage();
  }

  @override
  void didUpdateWidget(BlurryGlassPaneWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.image.image != oldWidget.image.image) {
      _getImage();
    }
  }

  void _getImage() {
    final oldImageStream = _imageStream;
    _imageStream =
        widget.image.image.resolve(createLocalImageConfiguration(context));
    if (_imageStream!.key != oldImageStream?.key) {
      // If the keys are the same, then we got the same image back, and so we don't
      // need to update the listeners. If the key changed, though, we must make sure
      // to switch our listeners to the new image stream.
      final listener = ImageStreamListener(_updateImage);
      oldImageStream?.removeListener(listener);
      _imageStream!.addListener(listener);
    }
  }

  void _updateImage(ImageInfo imageInfo, bool synchronousCall) {
    setState(() {
      // Trigger a build whenever the image changes.
      _imageInfo?.dispose();
      _imageInfo = imageInfo;
    });
  }

  @override
  void dispose() {
    _imageStream?.removeListener(ImageStreamListener(_updateImage));
    _imageInfo?.dispose();
    _imageInfo = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: widget.image.image,
          fit: BoxFit.cover,
        ),
      ),
      child: widget.canWipe
          ? GestureDetector(
              onPanStart: (details) {
                paths.add(
                  Path()
                    ..moveTo(details.localPosition.dx, details.localPosition.dy)
                    ..addRRect(
                      RRect.fromRectAndRadius(
                        Rect.fromCircle(
                          center: details.localPosition,
                          radius: pathRadius,
                        ),
                        rectRadius,
                      ),
                    ),
                );
              },
              onPanUpdate: (details) {
                setState(() {
                  final last = paths.last;
                  final newPath = Path.combine(
                    PathOperation.union,
                    last,
                    Path()
                      ..moveTo(
                        details.localPosition.dx,
                        details.localPosition.dy,
                      )
                      ..addRRect(
                        RRect.fromRectAndRadius(
                          Rect.fromCircle(
                            center: details.localPosition,
                            radius: pathRadius,
                          ),
                          rectRadius,
                        ),
                      ),
                  );
                  paths
                    ..remove(last)
                    ..add(newPath);
                });
              },
              onPanEnd: (_) {},
              child: CustomPaint(
                painter: BlurryGlassPainter(
                  _imageInfo?.image,
                  paths: paths,
                  blurLevel: widget.blurLevel,
                ),
              ),
            )
          : BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: widget.blurLevel,
                sigmaY: widget.blurLevel,
              ),
              child: const Text('  '),
            ),
    );
  }
}

class BlurryGlassPainter extends CustomPainter {
  BlurryGlassPainter(
    this.image, {
    required this.paths,
    required this.blurLevel,
  });
  final List<Path> paths;
  final ui.Image? image;
  final double blurLevel;
  final gesturePathPaint = Paint()
    ..color = Colors.transparent // 初始时整体绘制为0.1透明度的黑色
    ..style = PaintingStyle.fill // 使用 fill 绘制整体背景
    ..isAntiAlias = true
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 20;
  final imagePaint = Paint()
    ..isAntiAlias = true
    ..strokeWidth = 1
    ..imageFilter = ImageFilter.blur(sigmaX: 4, sigmaY: 4)
    ..style = PaintingStyle.stroke;
  @override
  void paint(Canvas canvas, Size size) {
    var unionDrawPath = Path();
    for (final path in paths) {
      canvas.drawPath(path, gesturePathPaint);
      unionDrawPath = Path.combine(PathOperation.union, unionDrawPath, path);
    }
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final imagePath = Path.combine(
      PathOperation.difference,
      Path()..addRect(rect),
      unionDrawPath,
    );

    if (image != null) {
      canvas.clipPath(imagePath);
      if (image == null || image!.width == 0 || image!.height == 0) {
        return;
      }
      final imageWidth = image!.width;
      final imageHeight = image!.height;
      final screenRatio = size.height / size.width;
      final imageRatio = imageHeight / imageWidth;
      if (screenRatio >= imageRatio) {
        // 需要左右裁剪图片
        final targetImageWidth = imageHeight ~/ screenRatio;
        final widthDiff = imageWidth - targetImageWidth;
        canvas.drawImageRect(
          image!,
          Rect.fromLTRB(
            widthDiff.toDouble() / 2,
            0,
            imageWidth - widthDiff.toDouble() / 2,
            imageHeight.toDouble(),
          ),
          Rect.fromLTRB(0, 0, size.width, size.height),
          imagePaint
            ..imageFilter =
                ImageFilter.blur(sigmaX: blurLevel, sigmaY: blurLevel),
        );
      } else {
        // 需要上下裁剪图片
        final targetImageHeight = size.height.toInt();
        final heightDiff = imageHeight - targetImageHeight;
        canvas.drawImageRect(
          image!,
          Rect.fromLTRB(
            0,
            heightDiff.toDouble() / 2,
            imageWidth.toDouble(),
            imageHeight.toDouble() - heightDiff.toDouble() / 2,
          ),
          Rect.fromLTRB(0, 0, size.width, size.height),
          imagePaint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
