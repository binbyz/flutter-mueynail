import 'package:flutter/material.dart';
import 'package:mueynail/const/color.dart';
import 'package:mueynail/const/style.dart';
import 'package:mueynail/const/value.dart';

class GlobalNavigation extends StatelessWidget {
  final ValueChanged<int> onItemTapped;
  final int currentIndex;

  const GlobalNavigation({required this.onItemTapped, required this.currentIndex, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onItemTapped,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: primaryColor,
      selectedLabelStyle: navigationTextStyle,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.other_houses_rounded), label: valueBrand),
        BottomNavigationBarItem(icon: Icon(Icons.mode_comment), label: '문의하기'),
        BottomNavigationBarItem(icon: Icon(Icons.medical_information), label: '예약하기'),
        BottomNavigationBarItem(icon: Icon(Icons.card_membership_rounded), label: '멤버쉽'),
      ],
    );
  }
}
