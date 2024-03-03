import 'package:advanced_widgets/src/helpers/helpers.dart';
import 'package:flutter/material.dart';

import 'keys_advanced.dart';

class KeysPage extends StatefulWidget {
  const KeysPage({super.key});

  @override
  State<KeysPage> createState() => _KeysPageState();
}

class _KeysPageState extends State<KeysPage> {
  bool isAdvanced = false;

  void _change() {
    setState(() {
      isAdvanced = !isAdvanced;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Работа с ключами'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _change,
        child: const Icon(Icons.change_circle_outlined),
      ),
      body: isAdvanced ? const TaskUI() : const SwapSquares(),
    );
  }
}

class SwapSquares extends StatefulWidget {
  const SwapSquares({super.key});

  @override
  State<SwapSquares> createState() => _SwapSquaresState();
}

class _SwapSquaresState extends State<SwapSquares> {
  bool swap = false;

  final k1 = UniqueKey();
  final k2 = UniqueKey();

  @override
  Widget build(BuildContext context) {
    final widgets = [
      Stateless(color: randomColor()),
      const SizedBox(height: 40),
      Stateless(color: randomColor()),
    ];

    List<Widget> list;
    if (!swap) {
      list = widgets.toList();
    } else {
      list = widgets.reversed.toList();
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ...list,
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              setState(() {
                swap = !swap;
              });
            },
            child: const Text('Swap widgets'),
          ),
        ],
      ),
    );
  }
}

class Stateless extends StatelessWidget {
  final Color color;

  const Stateless({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        color: color,
      ),
    );
  }
}

class Stateful extends StatefulWidget {
  final Color color;

  const Stateful({
    super.key,
    required this.color,
  });

  @override
  State<Stateful> createState() => _StatefulState();
}

class _StatefulState extends State<Stateful> {
  late Color color;

  @override
  void initState() {
    super.initState();

    color = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        color: color,
      ),
    );
  }
}
