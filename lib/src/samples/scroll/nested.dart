import 'package:flutter/material.dart';

class NestedPage extends StatelessWidget {
  const NestedPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 16,
      itemBuilder: (BuildContext content, int index) {
        return NestedHorizontalListView(parentIndex: index);
      },
    );
  }
}

class NestedHorizontalListView extends StatelessWidget {
  final int parentIndex;

  const NestedHorizontalListView({
    super.key,
    required this.parentIndex,
  });

  @override
  Widget build(BuildContext context) {
    const colors = [Colors.green, Colors.blue, Colors.indigo, Colors.red, Colors.orange];
    const height = 136.0;
    return SizedBox(
      height: height,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 20,
          itemBuilder: (BuildContext content, int index) {
            return ListViewColoredItem(
              index: index + 1,
              color: colors[(parentIndex + index) % colors.length],
              parentSize: height,
            );
          }),
    );
  }
}

class ListViewColoredItem extends StatelessWidget {
  final int index;
  final Color color;
  final double parentSize;

  const ListViewColoredItem({
    super.key,
    required this.index,
    required this.color,
    required this.parentSize,
  });

  @override
  Widget build(BuildContext context) {
    double edgeSize = 8.0;
    double itemSize = parentSize - edgeSize * 2.0;
    return Padding(
      padding: EdgeInsets.all(edgeSize),
      child: SizedBox(
        width: itemSize,
        height: itemSize,
        child: ColoredBox(
          color: color,
          child: Align(
            alignment: AlignmentDirectional.center,
            child: Text(
              '$index',
              style: const TextStyle(fontSize: 72.0, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
