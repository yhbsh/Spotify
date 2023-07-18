import 'package:flutter/material.dart';

class ShuffleMusicButton extends StatelessWidget {
  const ShuffleMusicButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return IconButton(
      constraints: const BoxConstraints.tightFor(width: 35, height: 35),
      padding: EdgeInsets.zero,
      hoverColor: Colors.white24,
      highlightColor: Colors.white38,
      onPressed: () {},
      icon: Icon(Icons.shuffle, color: colorScheme.primary, size: 25),
    );
  }
}
