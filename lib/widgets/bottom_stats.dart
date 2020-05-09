import 'package:covidstats/models/stats_get.dart';
import 'package:covidstats/widgets/day_stats_data.dart';
import 'package:flutter/material.dart';
import 'package:covidstats/widgets/day_stats_header.dart';

class BottomStats extends StatefulWidget {
  final String searchQuery;
  BottomStats(this.searchQuery);

  @override
  _BottomStatsState createState() => _BottomStatsState();
}

class _BottomStatsState extends State<BottomStats> {
  Future<Stats> futureStats;

  callback(a) {
    setState(() {
      futureStats = a;
    });
  }

  @override
  void initState() {
    futureStats = fetchStats(widget.searchQuery);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DayHeader(widget.searchQuery, callback),
        FutureBuilder<Stats>(
            future: futureStats,
            builder: (context, snapshot) {
              return StatsWidget(snapshot);
            }),
      ],
    );
  }
}
