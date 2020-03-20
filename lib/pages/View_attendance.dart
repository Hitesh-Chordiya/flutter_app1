import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/pages/AttendanceData.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final databaseReference = FirebaseDatabase.instance.reference();
  final db = FirebaseDatabase.instance.reference();
  final List<AttendanceData> attendanceDataList = List<AttendanceData>();
  dynamic mail,classs;
  void inputData() async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    // here you write the codes to input the data into firestore
     mail=user.email;

  }
  int attended_lect;
  int total_lect;
  int attended_pract;
  int total_pract;
  String subject;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    databaseReference.child('Attendance').child("Class").child("TE1").once().then((snapshot) {
      Map data = snapshot.value;
      for (final key in data.keys) {
        Map subjectData = data[key];
        subject = key.toString();
        attended_lect = 0;
        total_lect = 0;
        attended_pract = 0;
        total_pract = 0;

        for (final key in subjectData.keys) {
          try {
            Map TeacherData = subjectData[key];
            Map studinfo=TeacherData['1'];
            total_lect += int.parse(TeacherData['Total'].toString());
            attended_lect += int.parse(studinfo['Attended'].toString());
          }
          catch (Exception) {}
        } //per Subject

        AttendanceData a = new AttendanceData(
            subject, total_lect,attended_lect, total_pract, attended_pract);
        attendanceDataList.add(a);
      }//all data
    });

  }

  @override
  Widget build(BuildContext context) {
    double TotalAttendance=0;
    for(int i=0 ;i<attendanceDataList.length;i++)
    {
      TotalAttendance += (attendanceDataList[i].total_attendance/attendanceDataList.length);
    }
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            AttendancePieChart(attendanceDataList),
            Text(
              'Total Attendance : ${TotalAttendance.round()}',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                AttendanceUI(attendanceDataList[0].subjectName, attendanceDataList[0].total_lect,
                    attendanceDataList[0].attended_lect, attendanceDataList[0].total_pract,
                    attendanceDataList[0].attended_pract,attendanceDataList[0].total_attendance),
              ],

            ),

//              Container(
//                child:attendanceDataList.length==0 ? new Text("No Data Available"):new ListView.builder(
//                  itemCount: attendanceDataList.length,
//                  itemBuilder: (_,index){
//                    return AttendanceUI(attendanceDataList[index].subjectName, attendanceDataList[index].total_lect,
//                        attendanceDataList[index].attended_lect, attendanceDataList[index].total_pract,
//                        attendanceDataList[index].attended_pract,attendanceDataList[index].total_attendance);
//                  }
//                )
//              )
          ],
        ),

      ),
      appBar: AppBar(title: Text('AppName'),
      ),
    );
  }

  Widget AttendanceUI(String subjectName, int total_lect, int attended_lect,
      int total_pract, int attended_pract,double total_attendance) {
    return new Card(
      elevation: 5.0,
      margin: EdgeInsets.all(10.0),
      child: new Container(
        padding: EdgeInsets.all(10.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(
              subjectName,
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),

            new Text(
              'Attended lectures : ${attended_lect.toString()} out of : ${total_lect.toString()}',
              style: TextStyle(
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),

            new Text(
              'Attended Practicals : ${attended_pract.toString()} out of : ${total_pract.toString()}',
              style: TextStyle(
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),

            new Text(
              'Total Attendance : ${total_attendance.round().toString()} %',
              style: TextStyle(
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

//Pie Chart Class :
  Widget AttendancePieChart(List<AttendanceData> attendanceDataList) {
    List <PieChartSectionData> _sections = List <PieChartSectionData>();
    List<AttendanceData>data=List<AttendanceData>();
    double AttendanceCounter=0;

    for(int i=0;i<attendanceDataList.length;i++) {
      AttendanceCounter += (attendanceDataList[i].total_attendance/attendanceDataList.length);
      PieChartSectionData _item = PieChartSectionData(
        color: attendanceDataList[i].total_attendance>75 ? Colors.green[400]:Colors.orange,
        value: (attendanceDataList[i].total_attendance/attendanceDataList.length),
        title: '${attendanceDataList[i].subjectName}',
        radius: 50,
        titleStyle: TextStyle(
            color: Colors.white,
            fontSize: 15
        ),);
      _sections.add(_item);
    }

    if(AttendanceCounter<100)
    {
      PieChartSectionData _item = PieChartSectionData(
        color: Colors.red,
        value: (100-AttendanceCounter),
        title: 'Absent',
        radius: 50,
        titleStyle: TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),);
      _sections.add(_item);
    }

    return Container(
        child: AspectRatio(
            aspectRatio: 1,
            child: FlChart(
                chart: PieChart(
                  PieChartData(
                    sections: _sections,
                    borderData: FlBorderData(show: false),
                    centerSpaceRadius: 60,
                    sectionsSpace: 1,

                  ),
                )
            )
        )
    );
  }
}
