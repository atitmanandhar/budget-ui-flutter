import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<double> spending;

  BarChart({this.spending});

  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    spending.forEach((double expenses) {
      if (expenses > mostExpensive) {
        mostExpensive = expenses;
      }
    });

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(
            'Weekly Spending',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  size: 30.0,
                ),
                onPressed: () {},
              ),
              Text(
                'Nov 10, 2019 - Nov 16, 2019',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_forward,
                  size: 30.0,
                ),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Bar(
                  label: 'Su',
                  amountSpend: spending[0],
                  mostExpensive: mostExpensive),
              Bar(
                  label: 'Mo',
                  amountSpend: spending[1],
                  mostExpensive: mostExpensive),
              Bar(
                  label: 'Tu',
                  amountSpend: spending[2],
                  mostExpensive: mostExpensive),
              Bar(
                  label: 'We',
                  amountSpend: spending[3],
                  mostExpensive: mostExpensive),
              Bar(
                  label: 'Th',
                  amountSpend: spending[4],
                  mostExpensive: mostExpensive),
              Bar(
                  label: 'Fr',
                  amountSpend: spending[5],
                  mostExpensive: mostExpensive),
              Bar(
                  label: 'Sa',
                  amountSpend: spending[6],
                  mostExpensive: mostExpensive),
            ],
          ),
        ],
      ),
    );
  }
}

class Bar extends StatelessWidget {
  final String label;
  final double amountSpend;
  final double mostExpensive;

  final double _maxBarHeight = 150.0;

  Bar({this.label, this.amountSpend, this.mostExpensive});

  @override
  Widget build(BuildContext context) {
    final _barHeight = amountSpend / mostExpensive * _maxBarHeight;
    return Column(
      children: <Widget>[
        Text(
          '\$${amountSpend.toStringAsFixed(2)}',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 6.0),
        Container(
          width: 18.0,
          height: _barHeight,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          label,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
