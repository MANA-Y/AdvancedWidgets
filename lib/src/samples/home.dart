import 'package:advanced_widgets/src/helpers/helpers.dart';
import 'package:advanced_widgets/src/samples/canvas.dart';
import 'package:advanced_widgets/src/samples/interaction.dart';
import 'package:advanced_widgets/src/samples/scroll/scroll.dart';
import 'package:flutter/material.dart';

import 'custom.dart';
import 'keys/keys.dart';
import 'repaint_boundary.dart';
import 'layout.dart';
import 'trees.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final List<ExampleCardData> cardData;

  @override
  void initState() {
    super.initState();

    cardData = [
      ExampleCardData(
        icon: Icons.schema_outlined,
        description: 'Widget, Element и RenderObject',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TreesPage()),
          );
        },
      ),
      ExampleCardData(
        icon: Icons.key,
        description: 'Работа с ключами',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const KeysPage()),
          );
        },
      ),
      ExampleCardData(
        icon: Icons.photo_size_select_large,
        description: 'Sizes и Constraints',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LayoutPage()),
          );
        },
      ),
      ExampleCardData(
        icon: Icons.palette_outlined,
        description: 'Canvas и CustomPainter',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CanvasPage()),
          );
        },
      ),
      ExampleCardData(
        icon: Icons.back_hand_outlined,
        description: 'Пользовательский ввод',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const InteractionPage()),
          );
        },
      ),
      ExampleCardData(
        icon: Icons.format_list_bulleted_outlined,
        description: 'Scroll и Slivers',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ScrollPage()),
          );
        },
      ),
      ExampleCardData(
        icon: Icons.app_blocking,
        description: 'RepaintBoundary',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RepaintBoundaryPage()),
          );
        },
      ),
      ExampleCardData(
        icon: Icons.dashboard_customize_outlined,
        description: 'Deep custom',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CustomPage()),
          );
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        return CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              title: Text('Главный экран'),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => ExampleCard(
                  index: index,
                  cardData: cardData[index],
                ),
                childCount: cardData.length,
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.only(
                top: 32,
              ),
            ),
          ],
        );
      }),
    );
  }
}
