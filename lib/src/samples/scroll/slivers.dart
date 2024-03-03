import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SliversPage extends StatelessWidget {
  const SliversPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          delegate: CustomHeader(
            minExtent: 80.0,
            maxExtent: 250.0,
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 2.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return ColoredBox(
                color: Colors.teal[index % 9 == 0 ? 50 : 100 * (index % 9)]!,
                child: Align(
                  alignment: Alignment.center,
                  child: Text('grid item $index'),
                ),
              );
            },
            childCount: 20,
          ),
        ),
        const SliverPadding(padding: EdgeInsets.all(8)),
        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate: SliverChildBuilderDelegate(
            childCount: 27,
            (BuildContext context, int index) {
              return ColoredBox(
                color: Colors.lightBlue[index % 9 == 0 ? 50 : 100 * (index % 9)]!,
                child: Align(
                  alignment: Alignment.center,
                  child: Text('list item $index'),
                ),
              );
            },
          ),
        ),
        const SliverPadding(padding: EdgeInsets.all(8)),
        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate: SliverChildBuilderDelegate(
            childCount: 27,
                (BuildContext context, int index) {
              return ColoredBox(
                color: Colors.lightBlue[index % 9 == 0 ? 50 : 100 * (index % 9)]!,
                child: Align(
                  alignment: Alignment.center,
                  child: Text('list item $index'),
                ),
              );
            },
          ),
        ),
        const SliverPadding(padding: EdgeInsets.all(8)),
      ],
    );
  }
}

class CustomHeader implements SliverPersistentHeaderDelegate {
  CustomHeader({
    required this.minExtent,
    required this.maxExtent,
  });

  @override
  double maxExtent;
  @override
  double minExtent;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          color: Colors.blue,
        ),
        const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black54,
              ],
              stops: [0.5, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.repeated,
            ),
          ),
        ),
        const Positioned(
          left: 16.0,
          right: 16.0,
          bottom: 16.0,
          child: Text(
            'CustomHeader',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration =>
      OverScrollHeaderStretchConfiguration();

  @override
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration => null;

  @override
  TickerProvider? get vsync => null;
}
