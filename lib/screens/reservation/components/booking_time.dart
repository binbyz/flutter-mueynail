import 'package:flutter/material.dart';
import 'package:mueynail/constants/style.dart';

class BookingTime extends StatelessWidget {
  final DateTime dateTime;
  final bool checked;

  final _positiveTextStyle = positiveTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 18);
  final _negativeTestStyle = negativeTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 18);

  BookingTime({Key? key, required this.dateTime, required this.checked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 5,
      height: 40,
      decoration: checked ? positiveBoxDecoration : negativeBoxDecoration,
      child: Center(
        child: Text('14:00', style: checked ? _positiveTextStyle : _negativeTestStyle),
      ),
    );
  }
}
