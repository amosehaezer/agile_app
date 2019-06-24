import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'login.dart';
import 'register.dart';
import 'home.dart';
import 'forum.dart';
import 'assignment.dart';
import 'timeline.dart';
import 'profile.dart';

void main() => runApp(MaterialApp(
  home: Login(),
  routes: {
   '/register': (context) => Register(),
   '/home': (context) => Home(),
   '/forum': (context) => ListPage(),
   '/assignment': (context) => Assignment(),
  //  '/search': (context) => Search(),
   '/login': (context) => Login(),
   '/timeline': (context) => Timeline(),
   '/profiles': (context) => Profile(),
 },
  debugShowCheckedModeBanner: false,
));