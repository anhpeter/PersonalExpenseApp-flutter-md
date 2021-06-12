import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense_app/widgets/MyAlertDialog.dart';
import 'package:personal_expense_app/widgets/MyCard.dart';

class AddNewTransaction extends StatefulWidget {
  final Function addNewTransactionHandler;

  AddNewTransaction({@required this.addNewTransactionHandler});

  @override
  _AddNewTransactionState createState() => _AddNewTransactionState();
}

class _AddNewTransactionState extends State<AddNewTransaction> {
  final _nameController = new TextEditingController();
  final _ammountController = new TextEditingController();
  DateTime _pickedDate = DateTime.now();


  void initState() {
    _nameController.addListener(() {
      setState(() {});
    });
    _ammountController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  bool isFormValid() {
    return (_nameController.text.trim() != '' &&
        _ammountController.text.trim() != '');
  }

  void onSubmitHandler() {
    widget.addNewTransactionHandler(_nameController.text,
        double.parse(_ammountController.text), _pickedDate);
    _nameController.clear();
    _ammountController.clear();
    _pickedDate = DateTime.now();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return MyCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(labelText: "Name"),
          ),
          TextField(
            controller: _ammountController,
            decoration: InputDecoration(labelText: "Amount"),
            onChanged: (value) {
              try {
                double.parse(value);
              } catch (e) {
                _ammountController.clear();
                showDialog(
                  context: context,
                  builder: (ctx) => MyAlertDialog(
                    title: "Number only",
                    content: "This field accept number only",
                    actions: {
                      'Ok': () {
                        Navigator.of(ctx).pop();
                      }
                    },
                  ),
                );
              }
            },
          ),
          Row(
            children: [
              Expanded(
                child: Text(_pickedDate == null
                    ? "No date picked"
                    : 'Picked date: ${DateFormat('dd/MM/yyyy').format(_pickedDate)}'),
              ),
              TextButton(
                onPressed: () {
                  showDatePicker(
                      context: context,
                      initialDate:
                          _pickedDate != null ? _pickedDate : DateTime.now(),
                      currentDate: DateTime.now(),
                      firstDate: DateTime(2019),
                      lastDate: DateTime.now(),
                      builder: (context, child) {
                        return Theme(
                          data: ThemeData.light().copyWith(
                            colorScheme: ColorScheme.light(
                              primary: Theme.of(context).primaryColor,
                            ),
                          ),
                          child: child,
                        );
                      }).then((value) {
                    setState(() {
                      if (value != null) _pickedDate = value;
                    });
                  });
                },
                child: Text(
                  "Choose date",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: isFormValid() ? onSubmitHandler : null,
            child: Text("Add transaction"),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Theme.of(context).primaryColor),
            ),
          )
        ],
      ),
    );
  }

  void dispose() {
    _nameController.dispose();
    _ammountController.dispose();
    super.dispose();
  }
}
