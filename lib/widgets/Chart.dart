import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense_app/commons/models/Transaction.dart';
import 'package:personal_expense_app/providers/TransactionNotifier.dart';
import 'package:personal_expense_app/widgets/CharBarProgress.dart';
import 'package:personal_expense_app/widgets/MyCard.dart';
import 'package:provider/provider.dart';

class ChartBar {
  String label;
  double money;
  double percent;
  ChartBar(
      {@required this.label, @required this.money, @required this.percent});
}

class Chart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyCard(
      child: Container(
        height: MediaQuery.of(context).size.height < 500 ? 100 : 150,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: context
              .watch<TransactionNotifier>()
              .chartBarList
              .map((item) {
                return Expanded(
                  child: Column(
                    children: [
                      FittedBox(
                        child: Text("\$${item.money}"),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: ChartBarProgress(
                            percent: item.percent,
                          ),
                        ),
                      ),
                      Text(item.label),
                    ],
                  ),
                );
              })
              .toList()
              .reversed
              .toList(),
        ),
      ),
    );
  }
}
