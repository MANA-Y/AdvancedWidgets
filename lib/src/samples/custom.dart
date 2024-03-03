import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomPage extends StatelessWidget {
  const CustomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            print('Tapped!');
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Tapped!'),
              ),
            );
          },
          child: const CustomWidget(
            color: Colors.blue,
            child: SizedBox(
              height: 200,
              width: 200,
              child: Center(
                child: Text(
                  'Tap on me',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomWidget extends SingleChildRenderObjectWidget {
  final Color color;

  const CustomWidget({
    super.key,
    required this.color,
    required super.child,
  });

  @override
  RenderObject createRenderObject(BuildContext context) => CustomRenderObject(
        color: color,
      );

  @override
  void updateRenderObject(
    BuildContext context,
    covariant CustomRenderObject renderObject,
  ) {
    renderObject.color = color;
  }
}

class CustomRenderObject extends RenderBox with RenderObjectWithChildMixin<RenderBox> {
  Color _color;

  set color(Color value) {
    if (_color != value) {
      _color = value;
      markNeedsPaint();
    }
  }

  CustomRenderObject({
    required Color color,
  }) : _color = color;

  // /// Обработчик попадания тапа в размер.
  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    return size.contains(position);
  }

  /// Переопределяем обработчик попадания тапа на круговой.
  // @override
  // bool hitTest(
  //   HitTestResult result, {
  //   required Offset position,
  // }) {
  //   final Offset center = Offset(size.width / 2, size.height / 2);
  //
  //   // Рассчитываем радиус, как половину ширины виджета
  //   final double radius = size.shortestSide / 2;
  //
  //   // Проверяем, находится ли точка внутри круга
  //   if ((position - center).distance <= radius) {
  //     return true;
  //   }
  //
  //   // Возвращаем false, если точка снаружи круга
  //   return false;
  // }

  /// Задаем размер контейнера по размерам ребенка.
  @override
  void performLayout() {
    child!.layout(constraints, parentUsesSize: true);
    size = child!.size;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final Paint paint = Paint()
      ..color = _color
      ..style = PaintingStyle.fill;

    // Достаем из контекса холст и рисуем.
    context.canvas.drawCircle(size.center(offset), size.shortestSide / 2, paint);

    if (child != null) {
      final Offset childOffset = Offset(
        (size.width - child!.size.width) / 2,
        (size.height - child!.size.height) / 2,
      );

      // Передаем поток управления в потомок для его отрисовки.
      context.paintChild(child!, offset + childOffset);
    }
  }
}
