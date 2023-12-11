import 'package:flutter/material.dart';
import 'package:storyteller/constants/app_theme.dart';

class Dot extends StatelessWidget {
  const Dot({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: defaultAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: isActive ? 20 : 6,
      decoration: BoxDecoration(
        color: isActive
            ? Theme.of(context).primaryColor
            : Theme.of(context).focusColor,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
