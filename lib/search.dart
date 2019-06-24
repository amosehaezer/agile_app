import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        actions: <Widget>[
          IconButton(icon: Icon(
            Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          )
        ],
      ),
      drawer: Drawer(
        child: new ListView(
          children: <Widget>[
            new ListTile(
              title: new Text("FORUM"),
              trailing: new Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/forum");
              }
            ),
          ],
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {

  final cities = [
    'Jakarta',
    'Padang',
    'Serang',
    'Papua',
    'Manado',
    'Gorontalo',
  ];

  final recentCities = [
    'Jakarta'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // actions for app bar
    return [
      IconButton(icon: Icon(
        Icons.clear),
        onPressed: () {
          query = "";
        }
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the app bar
    return IconButton(icon: AnimatedIcon(
      icon: AnimatedIcons.menu_arrow,
      progress: transitionAnimation,
      ), 
      onPressed: () {
        close(context, null);
      });
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on the selection 
    return Card(
      color: Colors.red,
      child: Center(
        child: Text(query),
        ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    final suggestionList = query.isEmpty ? recentCities : cities.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context,index)=>ListTile(
        onTap: () {
          showResults(context);
        },
      leading: Icon(Icons.location_city),
      title: RichText(
        text: TextSpan(
          text: suggestionList[index].substring(0, query.length),
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          children: [TextSpan(
            text: suggestionList[index].substring(query.length),
            style: TextStyle(color: Colors.grey),
          )]
        ),
      )
    ),
    itemCount: suggestionList.length,
    );
  }

}