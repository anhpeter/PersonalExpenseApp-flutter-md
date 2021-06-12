import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense_app/commons/dummy/DummyTransactionList.dart';
import 'package:personal_expense_app/commons/models/Transaction.dart';
import 'package:personal_expense_app/widgets/Chart.dart';

class TransactionNotifier extends ChangeNotifier {
  List<Transaction> _txList = dummyTransactionList;

  List<Transaction> get txtList => _txList;

  List<Transaction> get transactionListForChart => _txList
      .where((element) =>
          element.date.isAfter(DateTime.now().subtract(Duration(days: 7))))
      .toList();

  List<ChartBar> get chartBarList {
    List<ChartBar> chartBarList = List.generate(7, (index) {
      DateTime contextDate = DateTime.now().subtract(Duration(days: index));
      String label = DateFormat('E').format(contextDate).substring(0, 1);
      double money = _txList.fold(0, (previousValue, element) {
        return previousValue +=
            element.date.day == contextDate.day ? element.ammount : 0;
      });
      double percentOfTotal =
          totalLastWeekMoney > 0 ? money / totalLastWeekMoney : 0;
      return ChartBar(label: label, money: money, percent: percentOfTotal);
    }).toList();
    return chartBarList;
  }

  double get totalLastWeekMoney {
    return _txList.fold(
        0, (previousValue, element) => previousValue + element.ammount);
  }

  void addNewTransactionHandler(String name, double ammount, DateTime date) {
    Transaction newTx = Transaction(name: name, ammount: ammount, date: date);
    _txList.add(newTx);
    notifyListeners();
  }

  void removeTransaction(int txId) {
    _txList.removeWhere((element) => element.id == txId);
    notifyListeners();
  }
}
