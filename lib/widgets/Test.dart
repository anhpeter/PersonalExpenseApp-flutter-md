import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  final String content;
  final MaterialColor color;
  Box({this.content, this.color});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: 140,
        height: 140,
        color: color,
        alignment: Alignment.center,
        child: Text(content),
      ),
    );
  }
}

class TwoBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Box(
          color: Colors.yellow,
          content: "1",
        ),
        Box(
          color: Colors.green,
          content: "2",
        )
      ],
    );
  }
}

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      color: Colors.blue,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 200,
          height: 200,
          color: Colors.purple,
        ),
      ),
    );
  }
}
