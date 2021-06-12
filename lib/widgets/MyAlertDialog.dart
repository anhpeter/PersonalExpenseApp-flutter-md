import 'package:flutter/material.dart';

class MyAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final Map<String, Function> actions;

  List<Map<String, dynamic>> get actionList {
    List<Map<String, dynamic>> actionList = [];
    actions.forEach((key, value) {
      Map<String, dynamic> item = {
        'label': key,
        'function': value,
      };
      actionList.add(item);
    });
    return actionList;
  }

  MyAlertDialog({
    this.title,
    this.content,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(title),
        content: Text(this.content),
        actions: actionList
            .map((item) => ElevatedButton(
                onPressed: item['function'], child: Text(item['label'])))
            .toList());
  }
}
