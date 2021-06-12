import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:personal_expense_app/commons/models/Transaction.dart';
import 'package:personal_expense_app/providers/TransactionNotifier.dart';
import 'package:personal_expense_app/widgets/MyCard.dart';
import 'package:provider/provider.dart';

class TransactionExcerpt extends StatelessWidget {
  final Transaction tx;

  TransactionExcerpt({@required this.tx});

  @override
  Widget build(BuildContext context) {
    print("Transaction build");
    return MyCard(
      padding: EdgeInsets.all(0),
      child: ListTile(
        onTap: () {},
        dense: false,
        trailing: IconButton(
          color: Colors.red,
          icon: Icon(Icons.delete),
          onPressed: () =>
              context.read<TransactionNotifier>().removeTransaction(tx.id),
        ),
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          child: FittedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
              child: Text(
                "\$${tx.ammount}",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        title: Text("${tx.name}"),
        subtitle: Text(DateFormat('dd/MM/yyyy').format(tx.date)),
      ),
    );
  }
}
