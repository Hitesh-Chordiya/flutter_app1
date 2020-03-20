//import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
void main()=>runApp(new TeacherPage());
class TeacherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primarySwatch:Colors.blue,),
      home:new HomePage(),
    );
  }
}
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Homepage"),
        elevation: defaultTargetPlatform == TargetPlatform.android?5.0:0.0,
      ),
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 5,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(99, (index) {
          return Center(
            child: Container(

              margin: const EdgeInsets.all(10.0),
              color: Colors.green.shade200,
              width: 48.0,
              height: 48.0,
              child:Center(
                child: Text(
                  '$index',
                  style: Theme.of(context).textTheme.headline,
                ),
              ),
            ),

          );
        }),
      ),
      drawer: new Drawer(

        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(accountName: new Text("Hitesh",style: TextStyle(fontSize: 20.0),),
                accountEmail: new Text("hietshac1999@gmail.com",style: TextStyle(fontSize: 15.0)),
             currentAccountPicture:new CircleAvatar(
               backgroundColor: Colors.black87,
                child: Icon(Icons.person,size: 70.0,),
             ),
            ),
            new ListTile(
              title: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2.0, 0.0, 10.0, 0),
                    child: new Icon(Icons.person,size: 30.0,),
                  ),
                  new Text("Profile",style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold),),

                ],
              ),
              trailing: Icon(Icons.arrow_right,color: Colors.black,),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(
                  builder: (context) => TeacherPage(),

                )
                );
              }
    ),
            new Divider(),
            new ListTile(
                title: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(2.0, 0.0, 10.0, 0),
                      child: new Icon(Icons.thumb_up,size: 28.0,),
                    ),
                    new Text("Like Us",style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold),),

                  ],
                ),
                trailing: Icon(Icons.arrow_right,color: Colors.black,),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(
                    builder: (context) => TeacherPage(),

                  )
                  );
                }
            ),
            new Divider(),
            new ListTile(
                title: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(2.0, 0.0, 10.0, 0),
                      child: new Icon(Icons.supervisor_account,size: 30.0,),
                    ),
                    new Text("class",style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold),),

                  ],
                ),
                trailing: Icon(Icons.arrow_right,color: Colors.black,),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(
                    builder: (context) => TeacherPage(),

                  )
                  );
                }
            ),
            new Divider(),
          ],
        ),
      ),
    );
  }
}
