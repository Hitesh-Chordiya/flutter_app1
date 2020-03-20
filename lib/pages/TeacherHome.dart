import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Signup.dart';
import 'package:flutter_app/pages/View_attendance.dart';
import 'package:flutter_app/pages/homepage.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Presignup extends StatefulWidget {
  @override
  _PresignupState createState() => _PresignupState();
}

class _PresignupState extends State<Presignup> {
  var _radioValue1,choice,_radioValue;
  dynamic value;


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: new Scaffold(
        body:new Container(
      child:Center(
        child: Row(

          children: <Widget>[
            new Radio(
              value: 0,
              groupValue: _radioValue1,
              onChanged: (value){
                setState(() {
                  _radioValue1=value;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Signup(),
                      ));
                });
              },

            ),
            new Text(
              'Teacher',
              style: new TextStyle(fontSize: 16.0),
            ),
            new Radio(
              value: 1,
              groupValue: _radioValue1,
              onChanged: (value){
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TeacherPage(),
                      ));

                });
              },
            ),
            new Text(
              'stud',
              style: new TextStyle(
                fontSize: 16.0,
              ),
            ),
]
//          Center(
//            child: Padding(
//              padding: const EdgeInsets.fromLTRB(20, 20, 20, bottom),
//              child: Radio(
//                value: 'one',
//                groupValue: _radioValue,
//                onChanged:(value){
//                  setState(() {
//                    _radioValue=value;
//                  });
//                },
//              ),
//            ),
//          ),
        ),
      ),

      ),
    ));
  }
}

class stud extends StatefulWidget {
  @override
  _studState createState() => _studState();
}

class _studState extends State<stud> with SingleTickerProviderStateMixin {
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
