import 'dart:math';

import 'package:flutter/material.dart';

class Illustrator extends StatefulWidget {
  const Illustrator({
    super.key,
    required this.illustrationsDescription,
  });

  final List<String> illustrationsDescription;

  @override
  State<Illustrator> createState() => _IllustratorState();
}

class _IllustratorState extends State<Illustrator> {
  AssetImage _getDefaultBackground() {
    Random random = Random();
    int randomNumber = random.nextInt(4) + 1;
    return AssetImage(
      'assets/img/writter$randomNumber.jpg',
    );
  }

  _generateBackground() {
    if (widget.illustrationsDescription.isEmpty) {
      return _getDefaultBackground();
    } else {
      return const AssetImage(
        'assets/img/splash1.jpg',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: _generateBackground(),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
