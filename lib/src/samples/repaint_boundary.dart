import 'dart:math';
import 'dart:ui';

import 'package:advanced_widgets/src/helpers/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

final _key = GlobalKey();

class RepaintBoundaryPage extends StatefulWidget {
  const RepaintBoundaryPage({super.key});

  @override
  State<RepaintBoundaryPage> createState() => _RepaintBoundaryPageState();
}

Future<void> saveImageByKey(GlobalKey key) async {
  final boundary = key.currentContext?.findRenderObject() as RenderRepaintBoundary?;
  final image = await boundary?.toImage();
  final byteData = await image?.toByteData(format: ImageByteFormat.png);
  final imageBytes = byteData?.buffer.asUint8List();

  print("First 32 bytes of image: ${imageBytes?.take(32)}");
}

class _RepaintBoundaryPageState extends State<RepaintBoundaryPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () async {
      await saveImageByKey(_key);
    });
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: _key,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('RepaintBoundary'),
        ),
        body: const Stack(
          children: [
            HeavyRepaint(),
            Cursor(),
          ],
        ),
      ),
    );
  }
}

class Cursor extends StatefulWidget {
  const Cursor({super.key});

  @override
  State<Cursor> createState() => _CursorState();
}

class _CursorState extends State<Cursor> {
  Offset? offset;

  _updateOffset(PointerEvent event) {
    setState(() {
      offset = event.localPosition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: _updateOffset,
      onPointerMove: _updateOffset,
      child: CustomPaint(
        painter: CursorPointer(offset: offset),
        child: const SizedBox.expand(),
      ),
    );
  }
}

class CursorPointer extends CustomPainter {
  final Offset? offset;

  const CursorPointer({this.offset});

  @override
  void paint(Canvas canvas, Size size) {
    if (offset != null) {
      canvas.drawCircle(
        offset!,
        48.0,
        Paint()
          ..color = Colors.blue.withOpacity(0.7)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10),
      );
    }
  }

  @override
  bool shouldRepaint(CursorPointer oldDelegate) => oldDelegate.offset != offset;
}

class Pixel {
  final Point<double> position;
  final Color color;

  const Pixel({
    required this.position,
    required this.color,
  });
}

class HeavyRepaint extends StatelessWidget {
  const HeavyRepaint({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      List<Pixel> pixels = [];
      for (int i = 0; i < 100000; i++) {
        pixels.add(
          Pixel(
            position: Point(
              randomPos(constraints.maxWidth),
              randomPos(
                constraints.maxHeight,
              ),
            ),
            color: randomColor(),
          ),
        );
      }

      return CustomPaint(
        isComplex: true,
        willChange: false,
        painter: StarPainter(pixels),
      );
    });
  }
}

class StarPainter extends CustomPainter {
  final List<Pixel> pixels;

  const StarPainter(this.pixels);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    for (var pixel in pixels) {
      paint.color = pixel.color;
      canvas.drawCircle(
        Offset(pixel.position.x, pixel.position.y),
        2,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant StarPainter oldDelegate) => pixels != oldDelegate.pixels;
}
