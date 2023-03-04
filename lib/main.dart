import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mueynail/app/components/app_navigation.dart';
import 'package:mueynail/constants/color.dart';
import 'package:mueynail/screens/member/member_screen.dart';

import 'screens/chat/chat_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/reservation/reservation_screen.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');

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
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: primaryColor,
            textStyle: const TextStyle(
              letterSpacing: -0.5,
              fontWeight: FontWeight.w500,
            ),
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
  int _currentNavigation = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const ChatScreen(),
    const ReservationScreen(),
    const MemberScreen(),
  ];

  void onSelectNavigation(int index) {
    setState(() {
      _currentNavigation = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: screens.elementAt(_currentNavigation),
      ),
      bottomNavigationBar: AppNavigation(
        onItemTapped: onSelectNavigation,
        currentIndex: _currentNavigation,
      ),
    );
  }
}
