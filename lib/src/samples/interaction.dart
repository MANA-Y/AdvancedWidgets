import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class InteractionPage extends StatelessWidget {
  const InteractionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Пользовательский ввод'),
        ),
        body: const NestedGestureDetectorsExample());
  }
}

enum _OnTapWinner { none, content1, content2, background }

class NestedGestureDetectorsExample extends StatefulWidget {
  const NestedGestureDetectorsExample({super.key});

  @override
  State<NestedGestureDetectorsExample> createState() =>
      _NestedGestureDetectorsExampleState();
}

class _NestedGestureDetectorsExampleState extends State<NestedGestureDetectorsExample> {
  _OnTapWinner _winner = _OnTapWinner.none;
  final Border highlightBorder = Border.all(color: Colors.red, width: 5);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: GestureDetector(
            onTap: () {
              debugPrint('Background onTap');
              setState(() {
                _winner = _OnTapWinner.background;
              });
            },
            onTapDown: (_) => debugPrint('Background onTapDown'),
            onTapCancel: () => debugPrint('Background onTapCancel'),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: _winner == _OnTapWinner.background ? highlightBorder : null,
                color: Colors.blue,
              ),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  SizedBox(
                    width: 200.0,
                    height: 100.0,
                    child: CustomButton(
                      color: Theme.of(context).colorScheme.background,
                      border: _winner == _OnTapWinner.content2 ? highlightBorder : null,
                      onTap: () {
                        debugPrint('Content2 onTap');
                        setState(() {
                          _winner = _OnTapWinner.content2;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 100.0,
                    height: 200.0,
                    child: CustomButton(
                      color: Colors.blue.shade200,
                      border: _winner == _OnTapWinner.content1 ? highlightBorder : null,
                      onTap: () {
                        debugPrint('Content1 onTap');
                        setState(() {
                          _winner = _OnTapWinner.content1;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Row(
            children: <Widget>[
              ElevatedButton(
                child: const Text('Reset'),
                onPressed: () {
                  setState(() {
                    _winner = _OnTapWinner.none;
                  });
                },
              ),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    debugPrintGestureArenaDiagnostics = false;
    super.dispose();
  }
}

class CustomButton extends StatelessWidget {
  final Color color;
  final BoxBorder? border;
  final VoidCallback? onTap;

  const CustomButton({
    super.key,
    required this.color,
    this.border,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: border,
          color: color,
        ),
      ),
    );
  }
}
