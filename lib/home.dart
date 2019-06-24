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
              trailing: new Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/timeline");
              }
            ),
            new ListTile(
              title: new Text("FORUM"),
              trailing: new Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/forum");
              }
            ),
            new ListTile(
              title: new Text("ASSIGNMENT"),
              trailing: new Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/assignment");
                }
              ),
            new ListTile(
              title: new Text("SEARCH"),
              trailing: new Icon(Icons.search),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/search");
                }
              ),
            new Divider(),
            new ListTile(
              title: new Text("SIGN OUT"),
              trailing: new Icon(Icons.arrow_upward),
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