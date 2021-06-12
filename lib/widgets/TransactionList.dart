import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:personal_expense_app/commons/models/Transaction.dart';
import 'package:personal_expense_app/providers/TransactionNotifier.dart';
import 'package:personal_expense_app/widgets/MyCard.dart';
import 'package:personal_expense_app/widgets/TransactionExcerpt.dart';
import 'package:provider/provider.dart';

class TransactionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Transaction> txList = context.watch<TransactionNotifier>().txtList;
    return txList.length > 0
        ? Expanded(
            child: Scrollbar(
              child: ListView.builder(
                itemCount: txList.length,
                itemBuilder: (BuildContext context, int index) {
                  return TransactionExcerpt(
                    tx: txList[index],
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
                    return Container();
                  },
                )
              ],
            )),
          );
  }
}
