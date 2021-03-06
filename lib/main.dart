import 'package:flutter/material.dart';

import 'package:flutter/animation.dart';
// import 'package:connectivity/connectivity.dart';

import 'minCard.dart';
import 'winCard.dart';
import 'fontStyle.dart';
import 'followUpSchedule.dart';
import 'controllers/dataManagement.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(child: HomePage()),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> with SingleTickerProviderStateMixin {
  Map minData = {'tcoun': 0, 'mcount': '0'};

  Animation manimation, tanimation;
  AnimationController animationController;

  Map trend = {'name': '_____________'};

  @override
  void initState() {
    animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);

    manimation = IntTween(begin: 0, end: int.parse(minData['mcount'])).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    tanimation = IntTween(begin: 0, end: minData['tcoun']).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    getMainMinData();
    getTrend();

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 900,
        decoration: db(Colors.grey[900]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            appTitle(context),
            dashBourd(context),
            WinCard(
              text: trend['name'],
            ),
            botton(context)
          ],
        ),
      ),
    );
  }

  Widget appTitle(context) => Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Container(
          decoration: db(Colors.black12) ?? null,
          height: 60,
          child: Column(
            children: [
              Container(
                decoration: db(Colors.grey[100]) ??
                    BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.35),

                            blurRadius: 4.0, // soften the shadow

                            spreadRadius: -1.0, //extend the shadow

                            offset: Offset(
                              0.0, // Move to right 10  horizontally

                              5.0, // Move to bottom 10 Vertically
                            ),
                          )
                        ]),
                width: MediaQuery.of(context).size.width - 50,
                height: 55,
                child: Center(
                    child: Text(
                  'لوحة الابتدائية',
                  style: h3(color: Colors.white70),
                )),
              ),
            ],
          ),
        ),
      );

  Widget dashBourd(context) => Container(
        decoration: db(Colors.grey[900]) ?? null,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellowAccent.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 2, bottom: 2, right: 25, left: 25),
                      child: Text(
                        'الانجازات',
                        style: TextStyle(
                            color: Colors.yellowAccent[700],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
              Container(
                decoration: db(Colors.amber) ??
                    BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                width: MediaQuery.of(context).size.width - 27,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(right: 1),
                        child: Minlss(
                          context: context,
                          color: Color(0xFF00FF94),
                          text: "إنجازً قراني",
                          number: tanimation.value,
                        )),
                    Padding(
                        padding: const EdgeInsets.only(left: 9),
                        child: Minlss(
                            context: context,
                            color: Color(0xFFF5EC00),
                            text: "صفحة مُراجعة",
                            number: manimation.value)),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget botton(context) => Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FollowUpSchedule()),
            );
          },
          child: Container(
            decoration: db(Colors.grey[100]) ??
                BoxDecoration(
                    color: Color(0xFF6FB9FE),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),

                        blurRadius: 4.0, // soften the shadow

                        spreadRadius: -1.0, //extend the shadow

                        offset: Offset(
                          0.0, // Move to right 10  horizontally

                          5.0, // Move to bottom 10 Vertically
                        ),
                      )
                    ]),
            width: MediaQuery.of(context).size.width - 30,
            height: 88,
            child: Center(
                child: Text(
              'جدول المتابعة',
              style: h3(color: Colors.white),
            )),
          ),
        ),
      );

  Future<void> getMainMinData() async {
    Map dataManager = await DataManagement().getMainMinState();

    manimation = IntTween(begin: 0, end: int.parse(dataManager['mcount']))
        .animate(
            CurvedAnimation(parent: animationController, curve: Curves.easeOut))
          ..addListener(() {
            setState(() {});
          });

    tanimation = IntTween(begin: 0, end: dataManager['tcoun']).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    animationController.forward();
  }

  Future<void> getTrend() async {
    Map dataManager = await DataManagement().getTrendState();
    setState(() {
      trend = dataManager;
    });
  }
}

db([color = Colors.blueAccent]) =>
    [null, BoxDecoration(border: Border.all(color: color, width: 3))][0];
