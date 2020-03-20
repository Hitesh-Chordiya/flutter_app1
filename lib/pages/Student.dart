import 'dart:developer';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/pages/View_attendance.dart';
import 'package:flutter_app/pages/homepage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Student extends StatefulWidget {
  @override
  _StudentState createState() => _StudentState();
}

class _StudentState extends State<Student> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    controller = new TabController(length: 1, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> events = [
      "Mark Attendance",
      "View Attendance",
    ];
    return new Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          image: DecorationImage(
              alignment: Alignment.center,
              image: AssetImage("assets/dem.png"),
              fit: BoxFit.cover),
        ),
        child: Container(
          margin: const EdgeInsets.only(left: 50.0),
          width: 300,
          child: GridView(
            physics: BouncingScrollPhysics(),
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
            children: events.map((title) {
              return GestureDetector(
                child: Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0)),
                  margin: const EdgeInsets.all(30.0),
                  child: getCardByTitle(title),
                ),
                onTap: () {
                  if(title=="View Attendance") {
                    Navigator.push(
                        context, MaterialPageRoute(
                      builder: (context) => Home(),
                    )
                    );
                  }
                  else{
                    Navigator.push(
                        context, MaterialPageRoute(

                      builder: (context) => HomePage(),
                    )
                    );
                  }


                  Fluttertoast.showToast(
                  msg: title,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.red,
                  textColor: Colors.white
                  ,
                  fontSize
                  :
                  16.0
                  );

                },
              );
            }).toList(),
          ),
        ),
      ),
//      body: GridView.count(crossAxisCount: 1,
//      children: List.generate(2, (index){
//            return new Card(
//              elevation: 5.0,
//              shape: new RoundedRectangleBorder(
//                borderRadius: new BorderRadius.circular(20.0)
//              ),
//              child: new Container(
//                child: new Text("$index",
//                style: TextStyle(
//
//                  fontSize: 5.0
//
//                ),),
//
//              ),
//            );
//      }
//      )),
      appBar: new AppBar(
        title: new Text("grid View"),
        backgroundColor: Colors.green,
        bottom: TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.face)),
          ],
        ),
      ),
    );
  }

  Column getCardByTitle(String title) {
    String img = '';
    if (title == "View Attendance")
      img = "assets/view.png";
    else if (title == "Mark Attendance") img = "assets/mark.png";
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new Center(
          child: Container(
            child: new Stack(
              children: <Widget>[
                new Image.asset(
                  img,
                  width: 100.0,
                  height: 100.0,
                )
              ],
            ),
          ),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
/*
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/pages/Signup.dart';
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
//    if(FirebaseAuth.instance.currentUser() != null){
//      // wrong call in wrong place!
//      return MaterialApp(
//        theme: ThemeData(
//          primarySwatch: Colors.green,
//        ),
//        home: new TeacherPage(),
//      );
//    }
//    else{
//      return MaterialApp(
//        theme: ThemeData(
//          primarySwatch: Colors.green,
//        ),
//        home: new LoginPage(),
//      );
//    }
//
    return FutureBuilder<FirebaseUser>(
        future: FirebaseAuth.instance.currentUser(),
    builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot){
    if (snapshot.hasData){
    FirebaseUser user = snapshot.data; // this is your user instance
    /// is because there is user already logged
    return TeacherPage();
    }
    /// other way there is no user logged.
    else
    return LoginPage();
    });

  }
}

 */