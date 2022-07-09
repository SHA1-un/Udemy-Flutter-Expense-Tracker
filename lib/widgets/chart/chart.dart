// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var sumTotal = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        final transactionDate = recentTransactions[i].date;
        if (transactionDate.day == weekDay.day &&
            transactionDate.month == weekDay.month &&
            transactionDate.year == weekDay.year) {
          sumTotal += recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'daily_total': sumTotal,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    var total = 0.0;
    return groupedTransactions.fold(total,
        (previousValue, element) => previousValue + element['daily_total']);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: groupedTransactions.map((groupedTransaction) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                groupedTransaction['day'],
                groupedTransaction['daily_total'],
                totalSpending == 0
                    ? 0
                    : (groupedTransaction['daily_total'] as double) /
                        totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
