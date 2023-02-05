import 'package:flutter/material.dart';
import 'package:mueynail/app/components/common_app_bar.dart';

class ReservationHistory extends StatelessWidget {
  const ReservationHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: '예약 내역'),
      body: Container(
        child: Text('Hello, World'),
      ),
    );
  }
}
