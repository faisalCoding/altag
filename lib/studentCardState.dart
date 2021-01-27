import 'package:flutter/material.dart';
import 'fontStyle.dart';

// ignore: must_be_immutable
class StudenCardState extends StatefulWidget {
  String name;

  String hfrom;

  String hto;

  String mto;

  String mfrom;

  List<bool> list = [false, false, false];

  bool hasFire;

  int starsCount = 2;

  StudenCardState(
      {this.name,
      this.hfrom,
      this.hto,
      this.mto,
      this.mfrom,
      this.starsCount,
      this.list,
      this.hasFire});
  @override
  _StudenCardStateState createState() => _StudenCardStateState(
      name: this.name,
      hfrom: hfrom,
      hto: hto,
      mto: mto,
      mfrom: mfrom,
      starsCount: starsCount,
      list: list,
      hasFire: hasFire);
}

class _StudenCardStateState extends State<StudenCardState> {
  String name = 'نأسف لقد حدث خطأ برمجي';

  String hfrom = 'نأسف لقد حدث خطأ برمجي';

  String hto = 'نأسف لقد حدث خطأ برمجي';

  String mto = 'نأسف لقد حدث خطأ برمجي';

  String mfrom = 'نأسف لقد حدث خطأ برمجي';

  int starsCount = 2;

  List<bool> list = [false, false, false];

  bool hasFire = false;

  _StudenCardStateState(
      {this.name,
      this.hfrom,
      this.hto,
      this.mto,
      this.mfrom,
      this.starsCount,
      this.list,
      this.hasFire = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width - 30,
        height: 200,
        decoration: BoxDecoration(
          color: Color(0xFF4999E3),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
          child: Column(
            // main column in containre
            children: [
              Expanded(flex: 2, child: starsAndList()),
              Expanded(
                flex: 3,
                child: whiteCard(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget starsAndList() => Row(
        // has list and stars
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Row(
                  //the stars
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    stars(
                        color: this.starsCount > 0 ? Color(0xFFFFC700) : null),
                    stars(color: this.starsCount > 1 ? Color(0xFFFFC700) : null)
                  ],
                ),
                stars(
                    size: 60,
                    color: this.starsCount == 3 ? Color(0xFFFFC700) : null)
              ],
            ),
          ),
          Expanded(
            child: Column(
              // the list
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                listItem(isDo: this.list[0] ?? false, text: 'أول شخص يسمع'),
                listItem(
                    isDo: this.list[1] ?? false, text: 'تكرار الحفظ 20 مرة'),
                listItem(isDo: this.list[2] ?? false, text: 'تسميع بدون اخطاء')
              ],
            ),
          ),
        ],
      );

  Widget stars({double size, Color color}) => Icon(
        Icons.star,
        size: size ?? 45,
        color: color ?? Colors.black26,
      );

  Widget listItem({bool isDo, double size, String text}) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            text ?? 'هناك خطأ برمجي',
            style: ls(
              color: isDo ? Colors.black54 : Colors.black26,
              // lineThrough: isDo ?? false
            ),
            textAlign: TextAlign.right,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Icon(
              isDo ? Icons.check_circle : Icons.radio_button_unchecked,
              size: size ?? 14,
              color: isDo ? Colors.white70 : Colors.white24,
            ),
          ),
        ],
      );

  Widget whiteCard() => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
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
        ),

        //white card
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  this.hasFire ?? false
                      ? Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Color(0xFFC2FFF0),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 2,
                                    color: Color(0xFF73E6C9).withOpacity(0.7),
                                    offset: Offset(1, 2))
                              ]),
                          child: Center(
                            child: Stack(
                              alignment: Alignment.topLeft,
                              children: [
                                Center(
                                  child: Icon(
                                    Icons.star_border_outlined,
                                    color: Colors.greenAccent,
                                    size: 40,
                                  ),
                                ),
                                Center(
                                  child: Icon(
                                    Icons.star,
                                    color: Colors.cyan,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(
                          width: 0,
                          height: 0,
                        ),
                  Text(
                    this.name,
                    style: h1(color: Colors.black),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 65,
                          height: 35,
                          child: Center(
                            child: Text(
                              this.mto,
                              style: ls(color: Colors.black54),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 65,
                        height: 35,
                        child: Center(
                            child: Text(this.mfrom,
                                style: ls(color: Colors.black54))),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black12.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 65,
                          height: 35,
                          child: Center(
                            child: Text(this.hto,
                                style: ls(color: Colors.black54)),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black12.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 65,
                        height: 35,
                        child: Center(
                            child: Text(this.hfrom,
                                style: ls(color: Colors.black54))),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      );
}
