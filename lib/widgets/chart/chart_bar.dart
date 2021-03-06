import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final label;
  final double dailySpending;
  final double spendingPercentageOfTotal;

  ChartBar(this.label, this.dailySpending, this.spendingPercentageOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 20,
            child:
                FittedBox(child: Text('R${dailySpending.toStringAsFixed(0)}'))),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(20)),
            ),
            FractionallySizedBox(
              heightFactor: spendingPercentageOfTotal,
              child: Container(
                // color: Color.fromRGBO(244, 136, 40, 1),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20)),
              ),
            )
          ]),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }
}
