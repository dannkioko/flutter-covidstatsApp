import 'package:flutter/material.dart';

import 'package:charts_flutter/flutter.dart' as charts;

class GraphScreen extends StatelessWidget {
  var searchQuery;
  List<charts.Series> seriesList;
  final bool animate =false;
  // GraphScreen(this.searchQuery, [this.seriesList ,this.animate]);

  // factory GraphScreen.withSampleData() {
  //   return GraphScreen(
  //     _createSampleData(),
  //     animate: false,
  //   );
  // }
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 5),
      new LinearSales(1, 25),
      new LinearSales(2, 100),
      new LinearSales(3, 75),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Graphs"), elevation: 0.0),
        body: Column(children: <Widget>[
          Container(
            height: 300.0,
            child: charts.LineChart(
              seriesList,
              animate: animate,
            ),
          )
        ]));
  }
}
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
