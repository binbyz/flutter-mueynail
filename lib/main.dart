import 'package:flutter/material.dart';
import 'package:mueynail/component/global_navigation.dart';
import 'package:mueynail/const/color.dart';
import 'package:mueynail/screen/chat/chat_screen.dart';
import 'package:mueynail/screen/home/home_screen.dart';
import 'package:mueynail/screen/reservation/reservation_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'notosans',
        primaryColor: primaryColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
          ),
        ),
      ),
      home: const AppScaffold(),
    ),
  );
}

class AppScaffold extends StatefulWidget {
  const AppScaffold({Key? key}) : super(key: key);

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  int currentNavigation = 0;

  void onSelectNavigation(int index) {
    setState(() {
      currentNavigation = index;
    });
  }

  Widget buildScreen() {
    if (currentNavigation == 1) {
      return const ChatScreen();
    } else if (currentNavigation == 2) {
      return const ReservationScreen();
    } else {
      return const HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildScreen(),
      bottomNavigationBar: GlobalNavigation(onItemTapped: onSelectNavigation, currentIndex: currentNavigation),
    );
  }
}
