import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.status,
    required this.iconWidget,
  });
  final String imagePath;
  final String name;
  final String status;
  final Widget iconWidget;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Column(
            children: [
              Expanded(child: Image.network(imagePath)),
              Text(name),
              Text(status),
            ],
          ),
          Positioned(top: 0, right: 0, child: iconWidget),
        ],
      ),
    );
  }
}
