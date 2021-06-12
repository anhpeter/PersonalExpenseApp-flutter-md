import 'package:flutter/material.dart';
import 'package:personal_expense_app/commons/models/Transaction.dart';
import 'package:personal_expense_app/providers/TransactionNotifier.dart';
import 'package:personal_expense_app/widgets/AddNewTransaction.dart';
import 'package:personal_expense_app/widgets/Chart.dart';
import 'package:personal_expense_app/widgets/TransactionLIst.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TransactionNotifier())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  void _startNewTransaction(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (_) {
          return SingleChildScrollView(
            child: AddNewTransaction(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    print("app build");
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
              Chart(),
              TransactionList(),
            ],
          ),
        ),
      ),
    );
  }
}
