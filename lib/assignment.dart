import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:forum_app/model/forum.dart';
import 'forum_detail_page.dart';
import 'package:http/http.dart' as http;

// class Forum extends StatelessWidget {
//   final String title;
//   Forum(this.title);

//   List<String> texts = [
//     '2017, Odd Semester', '2017, Even Semester', '2018, Odd Semester', '2018, Even Semester', '2019, Odd Semester',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text("Forum"),
//       ),
//       body: new Container(
//         child: new ListView.builder(
//           itemBuilder: (_,int index)=>EachList(this.texts[index]),
//           itemCount: this.texts.length,
//         ),
//       ),
//     );
//   }
// }

// class EachList extends StatelessWidget {
//   final String texts;
//   EachList(this.texts);
  
//   @override
//   Widget build(BuildContext context) {
//     return new Card(
//       child: new Container(
//         padding: EdgeInsets.all(8.0),
//         child: new Row(
//           children: <Widget>[
//             new Padding(
//               padding: EdgeInsets.only(right: 10.0)),
//               new Text(texts, 
//                        style: TextStyle(
//                        fontSize: 20.0))
//           ],
//         ),
//       ),
//     );
//   }
// }



class Assignment extends StatefulWidget {
  Assignment({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AssignmentState createState() => _AssignmentState();
}

class _AssignmentState extends State<Assignment> {
  List lessons;

  @override
  void initState() {
    lessons = getLessons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(Lesson lesson) => ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          // leading: Container(
          //   padding: EdgeInsets.only(right: 12.0),
          //   decoration: new BoxDecoration(
          //       border: new Border(
          //           right: new BorderSide(width: 1.0, color: Colors.white24))),
          //   child: Icon(Icons.autorenew, color: Colors.white),
          // ),
          title: Text(
            lesson.title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

          subtitle: Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                    // tag: 'hero',
                    child: LinearProgressIndicator(
                        backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                        value: lesson.indicatorValue,
                        valueColor: AlwaysStoppedAnimation(Colors.green)),
                  )),
              Expanded(
                flex: 4,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(lesson.level,
                        style: TextStyle(color: Colors.white))),
              )
            ],
          ),
          trailing:
              Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(lesson: lesson)));
          },
        );

    Card makeCard(Lesson lesson) => Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            child: makeListTile(lesson),
          ),
        );

    final makeBody = Container(
      decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: lessons.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(lessons[index]);
        },
      ),
    );

    // final makeBottom = Container(
    //   height: 55.0,
    //   child: BottomAppBar(
    //     color: Color.fromRGBO(58, 66, 86, 1.0),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       children: <Widget>[
    //         IconButton(
    //           icon: Icon(Icons.home, color: Colors.white),
    //           onPressed: () {},
    //         ),
    //         IconButton(
    //           icon: Icon(Icons.blur_on, color: Colors.white),
    //           onPressed: () {},
    //         ),
    //         IconButton(
    //           icon: Icon(Icons.hotel, color: Colors.white),
    //           onPressed: () {},
    //         ),
    //         IconButton(
    //           icon: Icon(Icons.account_box, color: Colors.white),
    //           onPressed: () {},
    //         )
    //       ],
    //     ),
    //   ),
    // );
    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      title: Text("Assignment"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.list),
          onPressed: () {},
        )
      ],
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: topAppBar,
      body: makeBody,
      // bottomNavigationBar: makeBottom,
    );
  }
}

List getLessons() {
  return [
    Lesson(
        title: "2017, Odd Semester",
        level: "Beginner",
        indicatorValue: 0.33,
        content:
            "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
    Lesson(
        title: "2017, Even Semester",
        level: "Beginner",
        indicatorValue: 0.33,
        content:
            "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
    Lesson(
        title: "2018, Odd Semester",
        level: "Intermidiate",
        indicatorValue: 0.66,
        content:
            "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
    Lesson(
        title: "2018, Even Semester",
        level: "Intermidiate",
        indicatorValue: 0.66,
        content:
            "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
    Lesson(
        title: "2019, Odd Semester",
        level: "Advanced",
        indicatorValue: 1.0,
        content:
            "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
  ];
}