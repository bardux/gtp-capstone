import 'package:flutter/material.dart';
import 'package:storyteller/constants/app_theme.dart';

class Content extends StatelessWidget {
  const Content({super.key, required this.text, required this.image});

  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(
            top: defaultPadding * 2,
            bottom: defaultPadding,
          ),
          child: Text(text),
        ),
        // const SizedBox(height: 10),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(defaultBorderRadius),
              child: Image.asset(
                image,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
