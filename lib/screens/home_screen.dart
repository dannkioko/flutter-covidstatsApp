import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:covidstats/models/stats_get.dart';
import 'package:covidstats/widgets/day_stats.dart';
import 'package:covidstats/widgets/day_stats_header.dart';
import 'package:covidstats/widgets/top_stats.dart';

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
  List<String> countries = ["kenya", "uganda", "tanzania"];
  String filter;

  @override
  void initState() {
    super.initState();
    // _searchQueryController.addListener(() {
    //   setState(() {
    //     filter = _searchQueryController.text;
    //   });
    // });
    futureStats = fetchStats(searchQuery);
  }

  Widget _buildSearchField() {
    return Column(children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Container(
          color: Colors.blue,
        ),
      ),
      TextField(
        onSubmitted: (value) {
          this.searchQuery = value;
          futureStats = fetchStats(searchQuery);
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
        onChanged: (query) {
          updateSearchQuery(query);
        },
      ),
      // ListView.builder(
      //     itemCount: countries.length,
      //     itemBuilder: (context, index) {
      //       return Card(child: Text(countries[index]));
      //     }),
    ]);
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

  callback(a) {
    setState(() {
      futureStats = a;
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
      body: FutureBuilder<Stats>(
          future: futureStats,
          builder: (context, snapshot) {
            return Column(
              children: <Widget>[
                TopStats(snapshot),
                DayStats(searchQuery, callback),
                StatsWidget(snapshot),
              ],
            );
          }),
    );
  }
}
