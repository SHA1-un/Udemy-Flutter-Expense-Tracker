import 'package:flutter/material.dart';
import '../../models/transaction.dart';

// import './transaction_input.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  // final Function _addTransaction;
  final List<Transaction> _transactions;
  final Function _deleteTransaction;

  TransactionList(this._transactions, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: _transactions.isEmpty
          ? Image.asset(
              "assets/images/no_items_transparent.png",
              fit: BoxFit.fitWidth,
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return TransactionItem(
                    _transactions[index], _deleteTransaction);
              },
              itemCount: _transactions.length,
            ),
    );
  }
}
