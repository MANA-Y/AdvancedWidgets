import 'package:flutter/material.dart';

class TreesPage extends StatelessWidget {
  const TreesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget, Element и RenderObject'),
      ),
      body: const Center(
        child: Leaf(),
      ),
    );
  }
}

/// Subclass of [RenderObjectWidget].
class Leaf extends LeafRenderObjectWidget {
  const Leaf({super.key});

  @override
  LeafRenderObjectElement createElement() => LeafRenderObjectElement(this);

  @override
  RenderObject createRenderObject(BuildContext context) => LeafRenderObject();
}

class LeafRenderObject extends RenderBox {
  @override
  void performLayout() {
    size = const Size(200, 200);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final w = size.width * 1.5;
    final h = size.height * 1.5;

    var path0 = Path()..fillType = PathFillType.nonZero;
    path0.moveTo(
      0.424715 * w,
      0 * h,
    );
    path0.cubicTo(
      0.424715 * w,
      0 * h,
      0.480385 * w,
      0.1361925 * h,
      0.24179375 * w,
      0.2276725 * h,
    );
    path0.cubicTo(
      0.112148754 * w,
      0.27736625 * h,
      0.01257375 * w,
      0.40473625 * h,
      0.13146624 * w,
      0.6014912 * h,
    );
    path0.cubicTo(
      0.14131251 * w,
      0.513545 * h,
      0.1835325 * w,
      0.319635 * h,
      0.36507624 * w,
      0.27538624 * h,
    );
    path0.cubicTo(
      0.36507624 * w,
      0.27538624 * h,
      0.19610624 * w,
      0.33856878 * h,
      0.18118 * w,
      0.62457 * h,
    );
    path0.cubicTo(
      0.26800376 * w,
      0.63676 * h,
      0.47163123 * w,
      0.6449512 * h,
      0.5320875 * w,
      0.4682425 * h,
    );
    path0.cubicTo(
      0.61192 * w,
      0.23477125 * h,
      0.424715 * w,
      0 * h,
      0.424715 * w,
      0 * h,
    );
    path0.close();
    Paint paint0 = Paint();
    paint0.color = const Color(0xFF3A7F0D);
    context.canvas.drawPath(path0.shift(offset), paint0);

    var path1 = Path()..fillType = PathFillType.nonZero;
    path1.moveTo(
      0.18125875 * w,
      0.62338 * h,
    );
    path1.cubicTo(
      0.36557877 * w,
      0.54981875 * h,
      0.49969375 * w,
      0.3774925 * h,
      0.51820374 * w,
      0.17177625 * h,
    );
    path1.cubicTo(
      0.4805225 * w,
      0.070133746 * h,
      0.424715 * w,
      0 * h,
      0.424715 * w,
      0 * h,
    );
    path1.cubicTo(
      0.424715 * w,
      0 * h,
      0.480385 * w,
      0.1361925 * h,
      0.24179375 * w,
      0.2276725 * h,
    );
    path1.cubicTo(
      0.112148754 * w,
      0.27736625 * h,
      0.01257375 * w,
      0.40473625 * h,
      0.13146624 * w,
      0.6014912 * h,
    );
    path1.cubicTo(
      0.14131251 * w,
      0.513545 * h,
      0.1835325 * w,
      0.319635 * h,
      0.36507624 * w,
      0.27538624 * h,
    );
    path1.cubicTo(
      0.36506626 * w,
      0.2753875 * h,
      0.19659875 * w,
      0.33841252 * h,
      0.18125875 * w,
      0.62338 * h,
    );
    path1.close();
    Paint paint1 = Paint();
    paint1.color = const Color(0xFF49A010);
    context.canvas.drawPath(path1.shift(offset), paint1);

    var path2 = Path()..fillType = PathFillType.nonZero;
    path2.moveTo(
      0.130305 * w,
      0.21498126 * h,
    );
    path2.cubicTo(
      0.130305 * w,
      0.21955127 * h,
      0.12848957 * w,
      0.2239341 * h,
      0.12525809 * w,
      0.22716558 * h,
    );
    path2.cubicTo(
      0.12202659 * w,
      0.23039708 * h,
      0.117643766 * w,
      0.2322125 * h,
      0.11307375 * w,
      0.2322125 * h,
    );
    path2.cubicTo(
      0.10850373 * w,
      0.2322125 * h,
      0.1041209 * w,
      0.23039708 * h,
      0.100889415 * w,
      0.22716558 * h,
    );
    path2.cubicTo(
      0.09765793 * w,
      0.2239341 * h,
      0.095842496 * w,
      0.21955127 * h,
      0.095842496 * w,
      0.21498126 * h,
    );
    path2.cubicTo(
      0.095842496 * w,
      0.21041125 * h,
      0.09765793 * w,
      0.2060284 * h,
      0.100889415 * w,
      0.20279692 * h,
    );
    path2.cubicTo(
      0.1041209 * w,
      0.19956543 * h,
      0.10850373 * w,
      0.19775 * h,
      0.11307375 * w,
      0.19775 * h,
    );
    path2.cubicTo(
      0.117643766 * w,
      0.19775 * h,
      0.12202659 * w,
      0.19956543 * h,
      0.12525809 * w,
      0.20279692 * h,
    );
    path2.cubicTo(
      0.12848957 * w,
      0.2060284 * h,
      0.130305 * w,
      0.21041125 * h,
      0.130305 * w,
      0.21498126 * h,
    );
    path2.close();
    Paint paint2 = Paint();
    paint2.color = const Color(0xFF3A7F0D);
    context.canvas.drawPath(path2.shift(offset), paint2);

    var path3 = Path()..fillType = PathFillType.nonZero;
    path3.moveTo(
      0.17953499 * w,
      0.19775 * h,
    );
    path3.cubicTo(
      0.17953499 * w,
      0.20454723 * h,
      0.17402473 * w,
      0.21005748 * h,
      0.16722749 * w,
      0.21005748 * h,
    );
    path3.cubicTo(
      0.16043025 * w,
      0.21005748 * h,
      0.15492 * w,
      0.20454723 * h,
      0.15492 * w,
      0.19775 * h,
    );
    path3.cubicTo(
      0.15492 * w,
      0.19095276 * h,
      0.16043025 * w,
      0.1854425 * h,
      0.16722749 * w,
      0.1854425 * h,
    );
    path3.cubicTo(
      0.17402473 * w,
      0.1854425 * h,
      0.17953499 * w,
      0.19095276 * h,
      0.17953499 * w,
      0.19775 * h,
    );
    path3.close();
    Paint paint3 = Paint();
    paint3.color = const Color(0xFF49A010);
    context.canvas.drawPath(path3.shift(offset), paint3);

    var path4 = Path()..fillType = PathFillType.nonZero;
    path4.moveTo(
      0.18691999 * w,
      0.080827504 * h,
    );
    path4.cubicTo(
      0.18691999 * w,
      0.09782062 * h,
      0.17314436 * w,
      0.11159625 * h,
      0.15615125 * w,
      0.11159625 * h,
    );
    path4.cubicTo(
      0.13915813 * w,
      0.11159625 * h,
      0.1253825 * w,
      0.09782062 * h,
      0.1253825 * w,
      0.080827504 * h,
    );
    path4.cubicTo(
      0.1253825 * w,
      0.0638344 * h,
      0.13915813 * w,
      0.050058756 * h,
      0.15615125 * w,
      0.050058756 * h,
    );
    path4.cubicTo(
      0.17314436 * w,
      0.050058756 * h,
      0.18691999 * w,
      0.0638344 * h,
      0.18691999 * w,
      0.080827504 * h,
    );
    path4.close();
    Paint paint4 = Paint();
    paint4.color = const Color(0xFF49A010);
    context.canvas.drawPath(path4.shift(offset), paint4);

    var path5 = Path()..fillType = PathFillType.nonZero;
    path5.moveTo(
      0.26076624 * w,
      0.15098125 * h,
    );
    path5.cubicTo(
      0.26076624 * w,
      0.15641919 * h,
      0.2563579 * w,
      0.1608275 * h,
      0.25092 * w,
      0.1608275 * h,
    );
    path5.cubicTo(
      0.24548206 * w,
      0.1608275 * h,
      0.24107374 * w,
      0.15641919 * h,
      0.24107374 * w,
      0.15098125 * h,
    );
    path5.cubicTo(
      0.24107374 * w,
      0.14554332 * h,
      0.24548206 * w,
      0.141135 * h,
      0.25092 * w,
      0.141135 * h,
    );
    path5.cubicTo(
      0.2563579 * w,
      0.141135 * h,
      0.26076624 * w,
      0.14554332 * h,
      0.26076624 * w,
      0.15098125 * h,
    );
    path5.close();
    Paint paint5 = Paint();
    paint5.color = const Color(0xFF49A010);
    context.canvas.drawPath(path5.shift(offset), paint5);

    var path6 = Path()..fillType = PathFillType.nonZero;
    path6.moveTo(
      0.36169875 * w,
      0.09559625 * h,
    );
    path6.cubicTo(
      0.36169875 * w,
      0.111230046 * h,
      0.34902507 * w,
      0.12390375 * h,
      0.33339128 * w,
      0.12390375 * h,
    );
    path6.cubicTo(
      0.3177575 * w,
      0.12390375 * h,
      0.30508378 * w,
      0.111230046 * h,
      0.30508378 * w,
      0.09559625 * h,
    );
    path6.cubicTo(
      0.30508378 * w,
      0.07996245 * h,
      0.3177575 * w,
      0.06728875 * h,
      0.33339128 * w,
      0.06728875 * h,
    );
    path6.cubicTo(
      0.34902507 * w,
      0.06728875 * h,
      0.36169875 * w,
      0.07996245 * h,
      0.36169875 * w,
      0.09559625 * h,
    );
    path6.close();
    Paint paint6 = Paint();
    paint6.color = const Color(0xFF49A010);
    context.canvas.drawPath(path6.shift(offset), paint6);
  }
}
