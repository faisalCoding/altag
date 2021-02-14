import 'package:altag/fontStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'studentCardState.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'controllers/dataManagement.dart';

class FollowUpSchedule extends StatefulWidget {
  @override
  _FollowUpScheduleState createState() => _FollowUpScheduleState();
}

class _FollowUpScheduleState extends State<FollowUpSchedule> {
  List<Widget> _studentCardState = [];
  List<String> _days = [];

  Widget dialog = Container(
    width: 0,
    height: 0,
  );

  bool _isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchDataApi();
    // checkUpdate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF6FB9FE),
        body: Stack(
          children: [
            SvgPicture.asset('assets/bgatag.svg'),
            SafeArea(
                child: Center(
                    child: _isLoaded
                        ? ListView.builder(
                            itemCount: _studentCardState.length,
                            itemBuilder: (BuildContext cntxt, int index) {
                              return _studentCardState[index];
                            })
                        : Center(
                            child: Loading(
                                indicator: BallPulseIndicator(), size: 100.0),
                          ))),
            dialog
          ],
        ));
  }

  Future<void> fetchDataApi() async {
    List<Widget> studentCardState = [];

    List<dynamic> getStudentData =
        await DataManagement().getStudenStCardState();

    if (getStudentData[0].containsKey('networkAvailable')) {
      setState(() {
        dialog = CupertinoAlertDialog(
          title: Text('لايوجد اتصال بالانترنت'),
          actions: [
            CupertinoDialogAction(
                child: Text('اعادة المحاولة'),
                onPressed: () {
                  setState(() {
                    dialog = Container(
                      width: 0,
                      height: 0,
                    );
                  });
                  fetchDataApi();
                })
          ],
        );
      });
    } else {
      getStudentData.forEach((value) {
        List<Widget> studens_states = [];

        if (value['studens_states'].length > 0) {
          value['studens_states'].forEach((val) {
            studens_states.add(StudenCardState(
              name: val['name'],
              hfrom: val['hfrom'],
              hto: val['hto'],
              mfrom: val['mfrom'],
              mto: val['mto'],
              starsCount: val['starsCount'],
              list: [...val['list']],
              hasFire: val['hasFire'] == 1 ? true : false,
            ));
          });
        }

        studentCardState.add(Column(
          children: [
            Center(
                child: Stack(
              children: <Widget>[
                // Stroked text as border.
                Text(
                  value['date'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 6
                      ..color = Colors.white,
                  ),
                ),
                // Solid text as fill.
                Text(
                  value['date'],
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )),
            ...studens_states
          ],
        ));
      });

      setState(() {
        _studentCardState = studentCardState;
        _isLoaded = true;
      });
    }
  }
}
