import 'package:flutter/material.dart';
import 'package:mueynail/component/main_app_bar.dart';
import 'package:mueynail/component/main_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedNavigation = 0;

  void _selectNavigation(int index) {
    setState(() {
      _selectedNavigation = index;
    });
  }

  List<Widget> _makeSlivers() {
    List<Widget> slivers = [];

    if (_selectedNavigation == 0) {
      slivers.add(const MainAppBar());
    }

    return slivers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ..._makeSlivers(),
        ],
      ),
      bottomNavigationBar: MainNavigation(onItemTapped: _selectNavigation, currentIndex: _selectedNavigation),
    );
  }
}
