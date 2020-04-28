import 'package:flutter/material.dart';
import 'package:covidstats/models/stats_get.dart';

class StatsWidget extends StatelessWidget {
  final AsyncSnapshot<Stats> snapshot;
  StatsWidget(this.snapshot);
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
            child: Container(
      child: snapshot.hasData == true
          ? Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(
                            left: 40.0, bottom: 20.0, top: 10.0),
                        child: Text(
                          "New Cases",
                          style: TextStyle(fontSize: 20.0),
                        )),
                    SizedBox(
                      width: 30.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 100.0),
                      child: Text(
                        snapshot.data.newCases==null?"0"
:                        "${snapshot.data.newCases}",
                        style: TextStyle(fontSize: 20.0, backgroundColor: Colors.yellowAccent),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(left: 40.0, bottom: 20.0),
                        child: Text(
                          "Critical Cases",
                          style: TextStyle(fontSize: 20.0),
                        )),
                    SizedBox(
                      width: 30.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 100.0),
                      child: Text(
                        snapshot.data.criticalCases != null?
                        "${snapshot.data.criticalCases}":"0",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(
                          left: 40.0,
                        ),
                        child: Text(
                          "Deaths",
                          style: TextStyle(fontSize: 20.0),
                        )),
                    SizedBox(
                      width: 30.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 100.0),
                      child: Text(snapshot.data.newDeaths==null?"0":
                        "${snapshot.data.newDeaths}",
                        style: TextStyle(fontSize: 20.0, backgroundColor: Colors.red),
                      ),
                    ),
                  ],
                ),
              ],
            )
          : Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(
                            left: 40.0, bottom: 10.0, top: 10.0),
                        child: Text(
                          "New Cases",
                          style: TextStyle(fontSize: 20.0),
                        )),
                    SizedBox(
                      width: 30.0,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(left: 40.0, bottom: 10.0),
                        child: Text(
                          "Critical Cases",
                          style: TextStyle(fontSize: 20.0),
                        )),
                    SizedBox(
                      width: 30.0,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(
                          left: 40.0,
                        ),
                        child: Text(
                          "Deaths",
                          style: TextStyle(fontSize: 20.0),
                        )),
                  ],
                ),
              ],
            ),
    )));
  }
}
