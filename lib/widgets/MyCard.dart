import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  MyCard(
      {@required this.child,
      this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 10)});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
