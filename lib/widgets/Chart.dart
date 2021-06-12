import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense_app/commons/models/Transaction.dart';
import 'package:personal_expense_app/widgets/CharBarProgress.dart';
import 'package:personal_expense_app/widgets/MyCard.dart';

class ChartBar {
  String label;
  double money;
  double percent;
  ChartBar(
      {@required this.label, @required this.money, @required this.percent});
}

class Chart extends StatelessWidget {
  final List<Transaction> txList;
  Chart({@required this.txList});

  double get totalLastWeekMoney {
    return txList.fold(
        0, (previousValue, element) => previousValue + element.ammount);
  }

  List<ChartBar> get chartBarList {
    List<ChartBar> chartBarList = List.generate(7, (index) {
      DateTime contextDate = DateTime.now().subtract(Duration(days: index));
      String label = DateFormat('E').format(contextDate).substring(0, 1);
      double money = txList.fold(0, (previousValue, element) {
        return previousValue +=
            element.date.day == contextDate.day ? element.ammount : 0;
      });
      double percentOfTotal =
          totalLastWeekMoney > 0 ? money / totalLastWeekMoney : 0;
      return ChartBar(label: label, money: money, percent: percentOfTotal);
    }).toList();
    return chartBarList;
  }

  @override
  Widget build(BuildContext context) {
    return MyCard(
      child: Container(
        height: MediaQuery.of(context).size.height < 500 ? 100 : 150,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: chartBarList
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
