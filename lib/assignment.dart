import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Assignment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Assignment"),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("asdas"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("asdasd"),
          ),
        ],
      ),
    );
  }
}