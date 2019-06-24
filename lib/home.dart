import 'package:flutter/material.dart';
import 'dart:ui';

class Home extends StatelessWidget {
  final Color c = const Color(0xFF174459);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("F O R S I G N M E N T"),
        backgroundColor: c,
        actions: <Widget>[
          IconButton(icon: Icon(
            Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          )
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Amos"),
              accountEmail: new Text("amosehaezer@gmail.com"),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.black,
                child: new Text("A"),
              ),
            ),
            new ListTile(
              title: new Text("TIMELINE"),
              trailing: new Icon(Icons.timeline),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/timeline");
              }
            ),
            new ListTile(
              title: new Text("FORUM"),
              trailing: new Icon(Icons.forum),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/forum");
              }
            ),
            new ListTile(
              title: new Text("ASSIGNMENT"),
              trailing: new Icon(Icons.assignment),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/assignment");
                }
              ),
            new ListTile(
              title: new Text("PROFILE"),
              trailing: new Icon(Icons.person),
              onTap: () {
                // Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/profiles");
                }
              ),
            new Divider(),
            // new ListTile(),
            // new ListTile(),
            // new ListTile(),
            new ListTile(
              title: new Text("SIGN OUT"),
              trailing: new Icon(Icons.eject),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/login");
                }
              ),
          ],
        ),
      ),
      body: new Container(
        child: new Center(
          child: new Text(""),
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