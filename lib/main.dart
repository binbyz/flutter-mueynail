import 'package:flutter/material.dart';
import 'package:mueynail/app/components/app_navigation.dart';
import 'package:mueynail/constants/color.dart';

import 'screens/chat/chat_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/reservation/reservation_screen.dart';

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
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: primaryColorOpacity)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: primaryColor)),
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
      body: Container(
        child: buildScreen(),
      ),
      bottomNavigationBar: AppNavigation(onItemTapped: onSelectNavigation, currentIndex: currentNavigation),
    );
  }
}
