import 'package:flutter/material.dart';

class PageViewPage extends StatelessWidget {
  const PageViewPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.horizontal,
      children: List.generate(
        1000000,
        (index) => PageContent(index: index, color: Colors.green),
      ),
    );
  }
}

class PageContent extends StatelessWidget {
  final int index;
  final Color color;

  const PageContent({
    super.key,
    required this.index,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: color,
      child: Align(
        alignment: AlignmentDirectional.center,
        child: Text(
          '$index',
          style: const TextStyle(fontSize: 132.0, color: Colors.white),
        ),
      ),
    );
  }
}
