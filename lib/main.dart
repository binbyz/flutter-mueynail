import 'package:flutter/material.dart';
import 'package:mueynail/const/color.dart';
import 'package:mueynail/screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: 'notosans', primaryColor: primaryColor),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
      },
    ),
  );
}
