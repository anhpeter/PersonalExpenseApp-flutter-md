import 'dart:math';

import 'package:flutter/foundation.dart';

class Transaction {
  int id;
  String name;
  double ammount;
  DateTime date;

  Transaction(
      {@required this.name, @required this.ammount, @required this.date}) {
    this.id = new Random().nextInt(9999);
  }

  void showInfo() {
    print("name: $name, ammount: $ammount, date: ${date.toString()}");
  }
}
