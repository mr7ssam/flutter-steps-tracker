import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/stateless_animation/play_animation.dart';

class NavigationPlayAnimation extends StatelessWidget {
  const NavigationPlayAnimation({
    Key? key,
    required this.index,
    required this.selectedIndex,
    required this.child,
  }) : super(key: key);
  final int index;
  final int selectedIndex;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PlayAnimation<double>(
      duration: const Duration(milliseconds: 450),
      tween: Tween(begin: 0, end: 1.0),
      delay: Duration(milliseconds: (index + 1) * 200),
      child: PlayAnimation<double>(
        key: ValueKey(selectedIndex == index),
        duration: const Duration(milliseconds: 200),
        tween: Tween(begin: 0.5, end: 1.0),
        curve: Curves.elasticInOut,
        builder: (context, _, value) {
          return Opacity(
            opacity: min(value, 1.0),
            child: Transform.scale(
              scale: value,
              child: child,
            ),
          );
        },
      ),
      curve: Curves.elasticInOut,
      builder: (context, child, value) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
    );
  }
}
