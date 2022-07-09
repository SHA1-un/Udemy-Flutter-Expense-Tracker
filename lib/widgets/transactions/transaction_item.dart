// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  final Function _deleteTransaction;
  TransactionItem(this.transaction, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: FittedBox(
                child: Text('R${transaction.amount.toStringAsFixed(2)}')),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(DateFormat.yMMMd().format(transaction.date)),
        trailing: IconButton(
            onPressed: () => _deleteTransaction(transaction.id),
            icon: Icon(Icons.delete)),
      ),
    );

    // return Card(
    //   elevation: 10,
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     children: [
    //       Container(
    //         decoration: BoxDecoration(
    //             border: Border.all(
    //           color: Theme.of(context).primaryColor,
    //           width: 2,
    //         )),
    //         margin: EdgeInsets.all(10),
    //         padding: EdgeInsets.all(10),
    //         child: Text(
    //           'R ${transaction.amount.toStringAsFixed(2)}',
    //           style: TextStyle(
    //             fontWeight: FontWeight.bold,
    //             fontSize: 20,
    //             color: Theme.of(context).primaryColor,
    //           ),
    //         ),
    //       ),
    //       Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Text(
    //             transaction.title,
    //             style: TextStyle(
    //               fontWeight: FontWeight.bold,
    //               fontSize: 15,
    //             ),
    //           ),
    //           Text(
    //             DateFormat.yMMMMEEEEd().format(transaction.date),
    //             style: TextStyle(
    //               fontSize: 10,
    //               color: Colors.grey,
    //             ),
    //           ),
    //         ],
    //       )
    //     ],
    //   ),
    // );
  }
}
