import 'package:flutter/material.dart';
import 'package:flutterapp/models/stats_get.dart';
import 'package:flutterapp/widgets/day_stats_header.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<Stats> futureStats;
  Stats stats;

  TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;
  String searchQuery = "all";

  @override
  void initState() {
    super.initState();
    futureStats = fetchStats(searchQuery);
  }
  Widget _buildSearchField() {
    return TextField(
      onSubmitted: (value){
        futureStats = fetchStats(value);
        Navigator.pop(context);
      },
      controller: _searchQueryController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: "Search Country...",
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.black),
      ),
      style: TextStyle(color: Colors.black, fontSize: 16.0),
      //onChanged: (query) {updateSearchQuery(query);},
    );
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return <Widget>[
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (_searchQueryController == null ||
                _searchQueryController.text.isEmpty) {
              Navigator.pop(context);
              return;
            }
            _clearSearchQuery();
          },
        ),
      ];
    }

    return <Widget>[
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: _startSearch,
      ),
    ];
  }

  void _startSearch() {
    ModalRoute.of(context)
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
      
    });
  }

  void updateSearchQuery(String newQuery) {
    setState(() {
      searchQuery = newQuery;

    });
  }

  void _stopSearching() {
    _clearSearchQuery();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearchQuery() {
    setState(() {
      _searchQueryController.clear();
      updateSearchQuery("");
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        leading: _isSearching ? const BackButton() : Container(),
        title: _isSearching ? _buildSearchField() : Text("COVID-19"),
        actions: _buildActions(),
      ),
      body: Column(children: <Widget>[
        FutureBuilder<Stats>(
          future: futureStats,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return Container(
              height: 320.0,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 30.0, top: 20.0),
                    child: Text(snapshot.data.countryName == null? "": snapshot.data.countryName,
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.0,
                        )),
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "Total Cases",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 10.0,
                          bottom: 5.0,
                        ),
                        child: Text("${snapshot.data.totalCases}",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Text(
                        "Active Cases",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 10.0,
                          bottom: 5.0,
                        ),
                        child: Text("${snapshot.data.activeCases}",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              "Recovered",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "${snapshot.data.totalRecoverd}",
                              style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              "Deaths",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "${snapshot.data.deaths}",
                              style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
            }
            else{
              return(Text(""));
            }
          },
        ),
        DayStats(searchQuery),
      ]),
    );
  }
}
