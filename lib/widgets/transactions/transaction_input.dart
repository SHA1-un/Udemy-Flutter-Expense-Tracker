import 'package:flutter/material.dart';
import '../../style.dart';
import 'package:intl/intl.dart';

class TransactionInput extends StatefulWidget {
  final Function addTransaction;
  TransactionInput(this.addTransaction);

  @override
  State<TransactionInput> createState() => _TransactionInputState();
}

class _TransactionInputState extends State<TransactionInput> {
  final titleInputController = TextEditingController();
  final amountInputController = TextEditingController();
  DateTime selectedDate;

  final style = Style();

  void _submit() {
    final enteredTitle = titleInputController.text;
    final enteredAmount = double.parse(amountInputController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || selectedDate == null) {
      return;
    }

    widget.addTransaction(
      enteredTitle,
      enteredAmount,
      selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime.now(),
    ).then((date) => {
          setState(() {
            selectedDate = date;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: style.textFieldInputDecoration(
                  "Title", Theme.of(context).primaryColor),
              controller: titleInputController,
              keyboardType: TextInputType.text,
              onSubmitted: (_) =>
                  _submit(), // underscore indicates that the value is not needed/used
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            TextField(
              decoration: style.textFieldInputDecoration(
                  "Amount", Theme.of(context).primaryColor),
              controller: amountInputController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submit(),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            Row(
              children: [
                Expanded(
                  child: Text(selectedDate == null
                      ? "No Date Selected!"
                      : 'Selected Date: ${DateFormat.yMd().format(selectedDate)}'),
                ),
                MaterialButton(
                  onPressed: _showDatePicker,
                  child: Text('Choose Date',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor)),
                )
              ],
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            MaterialButton(
              onPressed: (() => _submit()),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
              child: Text("Add Transaction"),
            )
          ],
        ),
      ),
    );
  }
}
