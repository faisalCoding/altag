import 'package:flutter/material.dart';
import 'fontStyle.dart';
import 'package:dotted_border/dotted_border.dart';

class WinCard extends StatelessWidget {
  BuildContext context;
  Color color;
  String text;
  int number;

  WinCard({this.context, this.color, this.text, this.number});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(12),
        padding: EdgeInsets.all(6),
        dashPattern: [80, 50, 80, 50],
        strokeCap: StrokeCap.round,
        strokeWidth: 5,
        color: Colors.black12,
        child: Container(
          decoration: db(),
          width: MediaQuery.of(context).size.width - 50,
          height: 120,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment(0, 0),
                          //stops: [0.0, 0.0, 0.0, 0.0],
                          colors: [
                            // Colors are easy thanks to Flutter's Colors class.
                            Color(0xFF00FFAA),
                            Color(0xFF00FFF2),
                            // Colors.indigo[600],
                            Colors.white,
                          ],
                        )),
                    child: Icon(
                      Icons.trending_up,
                      color: Colors.cyan,
                      size: 40,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.cyan.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 2, bottom: 2, right: 15, left: 15),
                          child: Text(
                            'المتصدر',
                            style: TextStyle(
                                color: Colors.cyan,
                                fontSize: 11,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  )
                ],
              ),
              Center(
                child: Text(
                  text ?? "______________",
                  style: h1(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

db([color = Colors.blueAccent]) =>
    [null, BoxDecoration(border: Border.all(color: color, width: 3))][0];
