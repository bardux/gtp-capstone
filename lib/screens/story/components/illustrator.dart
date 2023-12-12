import 'dart:math';

import 'package:flutter/material.dart';
import 'package:storyteller/models/image_generation.dart';
import 'package:storyteller/services/openai_service.dart';

class Illustrator extends StatefulWidget {
  const Illustrator({
    super.key,
    required this.illustrationDescription,
    required this.callback,
  });

  final String illustrationDescription;
  final VoidCallback callback;

  @override
  State<Illustrator> createState() => _IllustratorState();
}

class _IllustratorState extends State<Illustrator> {
  final OpenAIService _openAIService = OpenAIService();
  String _defaultImagePath = '';
  String _imgURL = "";
  bool _callbackExecuted = false;

  AssetImage _getDefaultBackground() {
    if (_defaultImagePath == "") {
      Random random = Random();
      int randomNumber = random.nextInt(4) + 1;
      setState(() => _defaultImagePath = 'assets/img/writter$randomNumber.jpg');
    }
    return AssetImage(_defaultImagePath);
  }

  _generateBackground() {
    if (widget.illustrationDescription == "") {
      return _getDefaultBackground();
    }
    if (_imgURL == "") {
      _createImage();
      return _getDefaultBackground();
    }
    if (!_callbackExecuted) {
      setState(() => _callbackExecuted = true);
      widget.callback();
    }
    return NetworkImage(_imgURL);
  }

  _createImage() async {
    ImageGeneration imageGenerated =
        await _openAIService.imageGeneration(widget.illustrationDescription);
    setState(() => _imgURL = imageGenerated.url);
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
