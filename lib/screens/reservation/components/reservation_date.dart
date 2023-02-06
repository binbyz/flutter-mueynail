import 'package:flutter/material.dart';
import 'package:mueynail/constants/style.dart';

class ReservationDate extends StatelessWidget {
  final DateTime dateTime;
  final bool checked;

  const ReservationDate({Key? key, required this.dateTime, required this.checked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(vertical: 15),
      height: 100,
      width: 80,
      decoration: checked ? positiveBoxDecoration : negativeBoxDecoration,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Text('2/14', style: summaryTextStyle.copyWith(fontSize: 16))),
            Expanded(child: Text('수요일', style: checked ? positiveTextStyle : negativeTextStyle)),
          ],
        ),
      ),
    );
  }
}
