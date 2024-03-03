import 'package:flutter/material.dart';

class CanvasPage extends StatelessWidget {
  const CanvasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Canvas и CustomPainter'),
      ),
      body: Center(
        child: SizedBox.expand(),
      ),
    );
  }
}
