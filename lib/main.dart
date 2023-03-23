import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mueynail/app/storage/storage.dart';
import 'package:mueynail/constants/color.dart';
import 'package:mueynail/screens/chat/chat_screen.dart';
import 'package:mueynail/screens/components/app_navigation.dart';
import 'package:mueynail/screens/home/home_screen.dart';
import 'package:mueynail/screens/login/login_screen.dart';
import 'package:mueynail/screens/member/member_screen.dart';
import 'package:mueynail/screens/reservation/reservation_screen.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');

  String initialRoute = await Storage().hasValidToken()
      ? '/'
      : '/login';

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SpoqaHanSansNeo',
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            letterSpacing: -0.5,
          ),
        ),
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
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateColor.resolveWith(
                  (states) => states.contains(MaterialState.selected)
                      ? primaryColor
                      : Colors.grey
            ),
          ),
      ),
      routes: {
        '/': (context) => const AppScaffold(),
        '/login': (context) => const LoginScreen(),
      },
      initialRoute: initialRoute,
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
