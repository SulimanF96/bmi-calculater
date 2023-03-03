import 'package:flutter/material.dart';

class SharedCard extends StatelessWidget {
  SharedCard(
      {required this.colour, required this.child, required this.onPress});

  final Color? colour;
  final Widget? child;
  final GestureTapCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10.0)),
        child: child,
      ),
    );
  }
}
