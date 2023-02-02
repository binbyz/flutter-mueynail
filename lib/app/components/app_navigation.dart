import 'package:flutter/material.dart';
import 'package:mueynail/constants/color.dart';
import 'package:mueynail/constants/style.dart';
import 'package:mueynail/constants/value.dart';

class AppNavigation extends StatelessWidget {
  final ValueChanged<int> onItemTapped;
  final int currentIndex;

  const AppNavigation({required this.onItemTapped, required this.currentIndex, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.black12, width: 1),
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        onTap: onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryColor,
        selectedLabelStyle: navigationTextStyle,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.other_houses_rounded), label: valueBrand),
          BottomNavigationBarItem(icon: Icon(Icons.mode_comment), label: '문의하기'),
          BottomNavigationBarItem(icon: Icon(Icons.medical_information), label: '예약하기'),
          BottomNavigationBarItem(icon: Icon(Icons.person_2_rounded), label: '내 정보'),
        ],
      ),
    );
  }
}
