import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'cardStudentState.dart';
import 'fontStyle.dart';

class FollowUpSchedule extends StatefulWidget {
  @override
  _FollowUpScheduleState createState() => _FollowUpScheduleState();
}

class _FollowUpScheduleState extends State<FollowUpSchedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF6FB9FE),
        body: Stack(
          children: [
            SvgPicture.asset('assets/bgatag.svg'),
            SafeArea(
                child: Center(
                    child: ListView(
              children: [
                CardStudenState(
                  name: 'حسام',
                  hfrom: 'الناس1',
                  hto: 'قريش',
                  mfrom: 'العاديات',
                  mto: 'الزلزلة',
                  starsCount: 3,
                  list: [true, true, true],
                  hasFire: true,
                ),
                CardStudenState(
                  name: 'faisal',
                  hfrom: 'الناس1',
                  hto: 'قريش',
                  mfrom: 'العاديات',
                  mto: 'الزلزلة',
                  starsCount: 3,
                  list: [false, true, false],
                ),
                CardStudenState(
                  name: 'عبد الاله',
                  hfrom: 'الناس1',
                  hto: 'قريش',
                  mfrom: 'العاديات',
                  mto: 'الزلزلة',
                  starsCount: 2,
                  list: [false, false, true],
                ),
                CardStudenState(
                  name: 'سليم',
                  hfrom: 'الناس1',
                  hto: 'قريش',
                  mfrom: 'العاديات',
                  mto: 'الزلزلة',
                  starsCount: 1,
                  list: [true, true, true],
                ),
                CardStudenState(
                  name: 'خالد',
                  hfrom: 'الناس1',
                  hto: 'قريش',
                  mfrom: 'العاديات',
                  mto: 'الزلزلة',
                  starsCount: 0,
                  list: [false, true, true],
                ),
                CardStudenState(
                  name: 'faisal',
                  hfrom: 'الناس1',
                  hto: 'قريش',
                  mfrom: 'العاديات',
                  mto: 'الزلزلة',
                  starsCount: 3,
                  list: [false, true, true],
                ),
                CardStudenState(
                  name: 'faisal',
                  hfrom: 'الناس1',
                  hto: 'قريش',
                  mfrom: 'العاديات',
                  mto: 'الزلزلة',
                  starsCount: 3,
                  list: [false, true, true],
                ),
                CardStudenState(
                  name: 'faisal',
                  hfrom: 'الناس1',
                  hto: 'قريش',
                  mfrom: 'العاديات',
                  mto: 'الزلزلة',
                  starsCount: 3,
                  list: [false, true, true],
                ),
                CardStudenState(
                  name: 'faisal',
                  hfrom: 'الناس1',
                  hto: 'قريش',
                  mfrom: 'العاديات',
                  mto: 'الزلزلة',
                  starsCount: 3,
                  list: [false, true, true],
                ),
              ],
            )))
          ],
        ));
  }
}
