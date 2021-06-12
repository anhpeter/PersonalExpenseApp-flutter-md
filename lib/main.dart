import 'package:flutter/material.dart';
import 'package:personal_expense_app/commons/dummy/DummyTransactionList.dart';
import 'package:personal_expense_app/commons/models/Transaction.dart';
import 'package:personal_expense_app/widgets/AddNewTransaction.dart';
import 'package:personal_expense_app/widgets/Chart.dart';
import 'package:personal_expense_app/widgets/TransactionLIst.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Transaction> _txList = dummyTransactionList;
  List<Transaction> get _transactionListForChart {
    return _txList
        .where((element) =>
            element.date.isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();
  }

  void _addNewTransactionHandler(String name, double ammount, DateTime date) {
    Transaction newTx = Transaction(name: name, ammount: ammount, date: date);
    setState(() {
      _txList.add(newTx);
    });
  }

  void _removeTransaction(int txId) {
    setState(() {
      _txList.removeWhere((element) => element.id == txId);
    });
  }

  void _startNewTransaction(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (_) {
          return SingleChildScrollView(
            child: AddNewTransaction(
                addNewTransactionHandler: _addNewTransactionHandler),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Personal Expense",
      theme: ThemeData(
        primaryColor: Colors.purple,
        accentColor: Colors.purple,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.purple,
        ),
      ),
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Builder(
          builder: (context) {
            return MediaQuery.of(context).size.height > 500
                ? MaterialButton(
                    onPressed: () => _startNewTransaction(context),
                    color: Colors.purple,
                    textColor: Colors.white,
                    child: Icon(
                      Icons.add,
                      size: 24,
                    ),
                    padding: EdgeInsets.all(16),
                    shape: CircleBorder(),
                  )
                : Container();
          },
        ),
        appBar: AppBar(
          title: Text("Personal Expense"),
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.add),
                onPressed: () => _startNewTransaction(context),
              ),
            )
          ],
        ),
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Chart(
                txList: _transactionListForChart,
              ),
              TransactionList(
                removeHandler: _removeTransaction,
                txList: _txList,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
