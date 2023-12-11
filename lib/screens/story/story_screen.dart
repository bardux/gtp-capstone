import 'package:flutter/material.dart';
import 'package:storyteller/widgets/app_bar.dart';

class StoryScreen extends StatelessWidget {
  const StoryScreen({super.key, required this.topic});

  final String topic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(child: Text(topic)),
    );
  }
}
