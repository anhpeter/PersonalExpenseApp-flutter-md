import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:personal_expense_app/commons/models/Transaction.dart';
import 'package:personal_expense_app/widgets/MyCard.dart';
import 'package:personal_expense_app/widgets/TransactionExcerpt.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> txList;
  final Function removeHandler;

  TransactionList({this.txList, this.removeHandler});

  @override
  Widget build(BuildContext context) {
    print('buid() List');
    return txList.length > 0
        ? Expanded(
            child: Scrollbar(
              child: ListView.builder(
                itemCount: txList.length,
                itemBuilder: (BuildContext context, int index) {
                  return TransactionExcerpt(
                    tx: txList[index],
                    removeHandler: removeHandler,
                  );
                },
              ),
            ),
          )
        : Container(
            width: double.infinity,
            child: MyCard(
                child: Column(
              children: [
                Text(
                  "No expense",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Builder(
                  builder: (context) {
                    print(MediaQuery.of(context).orientation);
                    return Container();
                  },
                )
              ],
            )),
          );
  }
}
