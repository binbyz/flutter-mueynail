import 'package:flutter/material.dart';
import 'package:mueynail/component/main_app_bar.dart';
import 'package:mueynail/component/main_navigation.dart';
import 'package:mueynail/const/color.dart';
import 'package:mueynail/screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: 'notosans', primaryColor: primaryColor),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const CustomScrollView(
        slivers: [
          MainAppBar(),
          SliverToBoxAdapter(
            child: SafeArea(
              child: HomeScreen(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: MainNavigation(onItemTapped: onSelectNavigation, currentIndex: currentNavigation),
    );
  }
}
