import 'package:flutter_app/pages/Signup.dart';
import 'package:flutter_app/pages/TeacherHome.dart';
import 'package:flutter_app/pages/View_attendance.dart';
import 'package:flutter_app/pages/homepage.dart';
import 'package:flutter_app/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/pages/Student.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new Home(),
    );
  }
}
