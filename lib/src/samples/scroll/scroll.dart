import 'package:advanced_widgets/src/samples/scroll/slivers.dart';
import 'package:flutter/material.dart';

import 'list.dart';
import 'nested.dart';
import 'page_view.dart';

class ScrollPage extends StatefulWidget {
  const ScrollPage({super.key});

  @override
  State<ScrollPage> createState() => _ScrollPageState();
}

enum ScrollExampleType {
  pageView,
  list,
  sliver,
  nested,
}

class _ScrollPageState extends State<ScrollPage> {
  var type = ScrollExampleType.pageView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scroll и Slivers'),
      ),
      body: Builder(builder: (context) {
        switch (type) {
          case ScrollExampleType.pageView:
            return const PageViewPage();
          case ScrollExampleType.list:
            return const ListPage();
          case ScrollExampleType.sliver:
            return const SliversPage();
          case ScrollExampleType.nested:
            return const NestedPage();
        }
      }),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: ScrollExampleType.values.indexOf(type),
        useLegacyColorScheme: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.view_week,
            ),
            label: "PageView",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.format_list_bulleted,
            ),
            label: "List",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.view_day,
            ),
            label: "Slivers",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
            ),
            label: "Nested",
          ),
        ],
      ),
    );
  }

  void onTap(int index) {
    setState(() {
      type = ScrollExampleType.values[index];
    });
  }
}
