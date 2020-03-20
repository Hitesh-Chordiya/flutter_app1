import 'dart:ui';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_app/pages/homepage.dart';
import 'package:flutter_app/pages/login_page.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> with SingleTickerProviderStateMixin {
  AnimationController _cardAnimationController;
  Animation<double> _loginCard;
  Animation<double> _signUpCard;
  var cla=['Select Class','FE1','FE2','FESS','SE1','SE2','SESS','TE1','TE2','TESS','BE1','BE2','BESS'];
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusNode focusNode3 = new FocusNode();
  FocusNode focusNode4 = new FocusNode();
  FocusNode focusNode5 = new FocusNode();
  FocusNode focusNode6 = new FocusNode();

  String _email, PRN, Roll, classs='Select Class';
  String _password, _name;
  final successSnackBar = new SnackBar(
      duration: Duration(milliseconds: 1000),
      shape:
      RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.00)),
      backgroundColor: Colors.lightGreen,
      elevation: 2.0,
      content: new Text("Logged in ",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'BalooChettan2',
              color: Colors.white,
              fontSize: 20.00)));
  final errSnackBar = new SnackBar(
      backgroundColor: Colors.red,
      content: new Text("Login Failed",
          style: TextStyle(
              fontFamily: 'BalooChettan2',
              color: Colors.white,
              fontSize: 20.00)));
  final incorrectPSnackBar = new SnackBar(
      duration: Duration(milliseconds: 1000),
      shape:
      RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.00)),
      backgroundColor: Colors.red,
      elevation: 2.0,
      content: new Text("Incorrect Password",
          style: TextStyle(
              fontFamily: 'BalooChettan2',
              color: Colors.white,
              fontSize: 20.00)));
  final noUserSnackBar = new SnackBar(
      duration: Duration(milliseconds: 1000),
      shape:
      RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.00)),
      elevation: 2.0,
      backgroundColor: Colors.red,
      content: new Text("User not Found",
          style: TextStyle(
              fontFamily: 'BalooChettan2',
              color: Colors.white,
              fontSize: 20.00)));

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: new Container(
            decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(10.00),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    tileMode: TileMode.clamp,
                    stops: [
                      0,
                      0.5,
                      0.8
                    ],
                    colors: [
                      //const Color.fromARGB(255, 52, 127, 228),
                      //const Color.fromARGB(255, 89, 76, 192),
                      Colors.blueAccent,
                      Colors.lightBlue,
                      const Color.fromARGB(255, 255, 255, 255)
                    ])),
            child: new Stack(
              children: <Widget>[
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 50.00, bottom: 20.00),
                      child: new Image(
                        image: new AssetImage("assets/college_logo.png"),
                        alignment: Alignment.topCenter,
                        height: 200,
                        width: 150,
                      ),
                    ),
                    new Card(
                      margin: new EdgeInsets.only(
                          left: 25.00, right: 25.00, bottom: 20.00, top: 20.00),
                      elevation: 10.0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        child: new Form(
                          key: formKey,
                          autovalidate: true,
                          child: new Theme(
                              data: new ThemeData(
                                  brightness: Brightness.light,
                                  primarySwatch: Colors.blue,
                                  inputDecorationTheme:
                                  new InputDecorationTheme(
                                      labelStyle: new TextStyle(
                                          color: Colors.blue,
                                          fontSize: 15.00))),
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Text(
                                    "REGISTER",
                                    style: TextStyle(
                                        fontFamily: 'BalooChettan2',
                                        color: Colors.black54,
                                        fontSize: 40.00,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 2.0),
                                  ),
                                  new Padding(padding: EdgeInsets.all(20.00)),
                                  Padding(
                                    padding:  EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    child: new Column(
                                      children: <Widget>[
                                        new TextFormField(

                                            focusNode: focusNode1,
                                            enableSuggestions: true,
                                            style: TextStyle(
                                                fontFamily: 'BalooChettan2',
                                                color: Colors.black54,
                                                fontSize: 20.00),
                                            decoration: new InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    left: 20.00, right: 20.00),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        10.00)),
                                                labelText: "Enter Email",
                                                labelStyle: new TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blue,
                                                    fontSize: 15.00)),
                                            keyboardType:
                                            TextInputType.emailAddress,
                                            validator: validateEmail,
                                            onChanged: (val) {
                                              setState(() => _email = val);
                                            }),
                                        new Padding(
                                            padding: EdgeInsets.all(15.00)),

                                        new TextFormField(
                                            focusNode: focusNode2,
                                            enableSuggestions: true,
                                            style: TextStyle(
                                                fontFamily: 'BalooChettan2',
                                                color: Colors.black54,
                                                fontSize: 20.00),
                                            decoration: new InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    left: 20.00, right: 20.00),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        10.00)),
                                                labelText: "Name",
                                                labelStyle: new TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blue,
                                                    fontSize: 15.00)),
                                            keyboardType: TextInputType.text,
                                            onChanged: (val) {
                                              setState(() => _name = val);
                                            }),

                                        new Padding(
                                            padding: EdgeInsets.all(10.0)),
                                        Padding(
                                            padding:const  EdgeInsets.only(
                                                right: 15),

                                            child: new Row(
                                              // crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                  new Flexible(child:
                                                  DropdownButton<String>(
                                                    items: cla.map((String listvalue) {
                                                      return DropdownMenuItem<String>(
                                                        value: listvalue,
                                                        child: Text(listvalue),
                                                      );
                                                    }).toList(),
                                                    onChanged: (val){
                                                      setState(() =>classs=val);
                                                    },
                                                    value: classs,
                                                  ),),
                                                  new Flexible(child:
                                                  new TextFormField(

                                                      focusNode: focusNode5,
                                                      enableSuggestions: true,
                                                      style: TextStyle(
                                                          fontFamily: 'BalooChettan2',
                                                          color: Colors.black54,
                                                          fontSize: 20.00),
                                                      decoration: new InputDecoration(
                                                          contentPadding: EdgeInsets.only(
                                                              left: 20.00, right: 20.00),
                                                          border: OutlineInputBorder(
                                                              borderRadius:
                                                              BorderRadius.circular(
                                                                  10.00)),
                                                          labelText: "Serial_no",
                                                          labelStyle: new TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              color: Colors.blue,
                                                              fontSize: 15.00)),
                                                      keyboardType: TextInputType.text,
                                                      onChanged: (val) {
                                                        setState(() => Roll = val);
                                                      }),),
                                                ])
                                        ),


//)
//                                        new TextFormField(
//                                            focusNode: focusNode3,
//                                            style: TextStyle(
//                                                fontFamily: 'BalooChettan2',
//                                                color: Colors.black54,
//                                                fontSize: 20.00),
//                                            decoration: new InputDecoration(
//                                                contentPadding: EdgeInsets.only(
//                                                    left: 20.00, right: 20.00),
//                                                border: OutlineInputBorder(
//                                                    borderRadius:
//                                                        BorderRadius.circular(
//                                                            10.00)),
//                                                labelText: "Class",
//                                                labelStyle: TextStyle(
//                                                    fontWeight: FontWeight.bold,
//                                                    color: Colors.blue,
//                                                    fontSize: 15.00)),
//                                            keyboardType: TextInputType.text,
//                                            validator: validatePassword,
//                                            onChanged: (val) {
//                                              setState(() => classs = val);
//                                            }),
                                        new Padding(
                                            padding: EdgeInsets.all(15.00)),
                                        new TextFormField(
                                            focusNode: focusNode4,
                                            enableSuggestions: true,
                                            style: TextStyle(
                                                fontFamily: 'BalooChettan2',
                                                color: Colors.black54,
                                                fontSize: 20.00),
                                            decoration: new InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    left: 20.00, right: 20.00),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        10.00)),
                                                labelText: "PRN",
                                                labelStyle: new TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blue,
                                                    fontSize: 15.00)),
                                            keyboardType: TextInputType.text,
                                            onChanged: (val) {
                                              setState(() => PRN = val);
                                            }),
                                        new Padding(
                                            padding: EdgeInsets.all(15.00)),

                                        new TextFormField(
                                            focusNode: focusNode6,
                                            style: TextStyle(
                                                fontFamily: 'BalooChettan2',
                                                color: Colors.black54,
                                                fontSize: 20.00),
                                            decoration: new InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    left: 20.00, right: 20.00),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        10.00)),
                                                labelText: "Enter Password",
                                                labelStyle: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blue,
                                                    fontSize: 15.00)),
                                            keyboardType: TextInputType.text,
                                            obscureText: true,
                                            validator: validatePassword,
                                            onChanged: (val) {
                                              setState(() => _password = val);
                                            }),
                                        new Padding(
                                            padding: EdgeInsets.all(15.00)),
                                      ],
                                    ),
                                  ),
                                  new Padding(
                                      padding:
                                      const EdgeInsets.only(top: 30.00)),
                                  new RaisedButton(
                                      shape: new RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(100.00)),
                                      splashColor: Colors.blue,
                                      onPressed: () async {
                                        if (formKey.currentState.validate()) {
                                          signUp(_email, _password);

                                          formKey.currentState.save();


                                        }
                                      },
                                      elevation: 2.0,
                                      padding: EdgeInsets.only(
                                          left: 50.00,
                                          right: 50.00,
                                          top: 15.00,
                                          bottom: 15.00),
                                      color: Color.fromARGB(255, 52, 127, 228),
                                      textColor: Colors.white,
                                      child: new Text("Sign Up",
                                          textAlign: TextAlign.center)),
                                  new Padding(
                                      padding: EdgeInsets.only(bottom: 15.00))
                                ],
                              )),
                        ),
                      ),
                    ),

                  ],
                )
              ],
            ),
          ),
        ));
  }

  Future signUp(String email, String password) async {
    try {
      AuthResult result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      store(_email,_name,classs,PRN,Roll);
      FirebaseUser user = result.user;
      assert(user != null);
      assert(await user.getIdToken() != null);

      final FirebaseUser currentUser = await auth.currentUser();
      assert(user.uid == currentUser.uid);
      Fluttertoast.showToast(
          msg: "Sign up Successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize:  16.0
      );
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                HomePage(),
          ));


    }
    catch(e ) {
      if(e is PlatformException) {
        if(e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
          /// `foo#bar.com` has alread been registered.
          Fluttertoast.showToast(
              msg: "Email already in use",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize:  16.0

          );
        }
      }
      return null;
    }
  } //Firebase Sign in
  Future<FirebaseUser> signIn(String email, String password) async {
    try {
      AuthResult result = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      FirebaseUser user = result.user;
      assert(user != null);
      assert(await user.getIdToken() != null);

      final FirebaseUser currentUser = await auth.currentUser();
      assert(user.uid == currentUser.uid);
      print(user);
      return user;
    } catch (e) {
      handleError(e);
      return null;
    }
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value.isEmpty || !regex.hasMatch(value))
      return 'Invalid Email';
    else
      return null;
  }

  String validatePassword(String value) {
    if (value.trim().isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 6) {
      return 'Password too short';
    }
    return null;
  }

  handleError(PlatformException error) {
    switch (error.code) {
      case 'ERROR_USER_NOT_FOUND':
        setState(() {
          scaffoldKey.currentState.showSnackBar(noUserSnackBar);
        });
        break;
      case 'ERROR_WRONG_PASSWORD':
        setState(() {
          scaffoldKey.currentState.showSnackBar(incorrectPSnackBar);
        });
        break;
    }
  }

  void store(String email, String name, String classs, String prn, String roll) {
    var a=   email.split("@");
    FirebaseDatabase database = new FirebaseDatabase();
    DatabaseReference _userRef=database.reference().child('Student').child(a[0]);
    _userRef.set(<String ,String>{
      "name": "" + name,
      "PRN": "" + prn,
      "Serial_no": "" + roll,
      "Class":""+classs,

    });


  } //Sign in Error handling
}