import 'package:flutter/material.dart';

class ExampleCardData {
  final IconData icon;
  final String description;
  final VoidCallback? onTap;

  const ExampleCardData({
    required this.icon,
    required this.description,
    this.onTap,
  });
}

class ExampleCard extends StatelessWidget {
  final ExampleCardData cardData;
  final int index;

  const ExampleCard({
    super.key,
    required this.cardData,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: cardData.onTap,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    cardData.icon,
                    size: 48,
                  ),
                  Text(
                    cardData.description,
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.all(16.0),
            child: Text(
              index.toString(),
            ),
          ),
        ),
      ],
    );
  }
}
