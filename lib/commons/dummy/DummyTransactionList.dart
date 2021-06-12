import 'package:personal_expense_app/commons/models/Transaction.dart';

List<Transaction> dummyTransactionList = [
  Transaction(name: "shopping", ammount: 50, date: DateTime.now()),
  Transaction(
      name: "play badminton",
      ammount: 19,
      date: DateTime.now().subtract(Duration(days: 1))),
  Transaction(
    name: "see movie",
    ammount: 25,
    date: DateTime.now().subtract(Duration(days: 2)),
  ),
  Transaction(
    name: "restaurant",
    ammount: 60,
    date: DateTime.now().subtract(Duration(days: 3)),
  ), //
];
