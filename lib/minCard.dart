import 'package:flutter/material.dart';

import 'fontStyle.dart';

class MinCard extends StatefulWidget {
  BuildContext context;
  Color color;
  String text;
  int number;

  MinCard({this.context, this.color, this.text, this.number});

  @override
  _MinCardState createState() => _MinCardState(
      context: this.context,
      color: this.color,
      text: this.text,
      number: this.number);
}

class _MinCardState extends State<MinCard> with SingleTickerProviderStateMixin {
  BuildContext context;
  Color color;
  String text;
  int number;

  _MinCardState({this.context, this.color, this.text, this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: db() ?? linear(color1: this.color, color2: Colors.white),
      width: MediaQuery.of(this.context).size.width / 2.3,
      height: MediaQuery.of(this.context).size.width / 2.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              "${this.number.toString()}",
              style: h1(color: Colors.black.withOpacity(0.55), s: 50.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 5.0,
            ),
            child: Text(this.text,
                textAlign: TextAlign.center,
                style: h3(color: Colors.black.withOpacity(0.7))),
          )
        ],
      ),
    );
  }

  BoxDecoration linear({color1, color2}) => BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 4.0, // soften the shadow
          spreadRadius: -1.5, //extend the shadow
          offset: Offset(
            0.0, // Move to right 10  horizontally
            5.0, // Move to bottom 10 Vertically
          ),
        )
      ],
      borderRadius: BorderRadius.circular(20),
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment(0.0, -0.9),
        //stops: [0.0, 0.0, 0.0, 0.0],
        colors: [
          // Colors are easy thanks to Flutter's Colors class.
          color1 ?? Color(0xFF00FF94),
          // Colors.indigo[700],
          // Colors.indigo[600],
          Colors.white,
        ],
      ));
}

db([color = Colors.blueAccent]) =>
    [null, BoxDecoration(border: Border.all(color: color, width: 3))][0];

class Minlss extends StatelessWidget {
  BuildContext context;
  Color color;
  String text;
  int number;

  Minlss({this.context, this.color, this.text, this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: db() ?? linear(color1: this.color, color2: Colors.white),
      width: MediaQuery.of(this.context).size.width / 2.3,
      height: MediaQuery.of(this.context).size.width / 2.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              "${this.number.toString()}",
              style: h1(color: Colors.black.withOpacity(0.55), s: 50.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 5.0,
            ),
            child: Text(this.text,
                textAlign: TextAlign.center,
                style: h3(color: Colors.black.withOpacity(0.7))),
          )
        ],
      ),
    );
  }

  BoxDecoration linear({color1, color2}) => BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 4.0, // soften the shadow
          spreadRadius: -1.5, //extend the shadow
          offset: Offset(
            0.0, // Move to right 10  horizontally
            5.0, // Move to bottom 10 Vertically
          ),
        )
      ],
      borderRadius: BorderRadius.circular(20),
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment(0.0, -0.9),
        //stops: [0.0, 0.0, 0.0, 0.0],
        colors: [
          // Colors are easy thanks to Flutter's Colors class.
          color1 ?? Color(0xFF00FF94),
          // Colors.indigo[700],
          // Colors.indigo[600],
          Colors.white,
        ],
      ));
}
