import 'package:flutter/material.dart';
import 'package:mueynail/const/color.dart';
import 'package:mueynail/const/value.dart';

class MainNavigation extends StatelessWidget {
  final ValueChanged<int> onItemTapped;
  final int currentIndex;

  const MainNavigation({required this.onItemTapped, required this.currentIndex, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onItemTapped,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: primaryColor,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.other_houses_rounded), label: vBrand),
        BottomNavigationBarItem(icon: Icon(Icons.medical_information), label: '예약하기'),
        BottomNavigationBarItem(icon: Icon(Icons.event_available_rounded), label: '이벤트'),
        BottomNavigationBarItem(icon: Icon(Icons.card_membership_rounded), label: '멤버쉽'),
      ],
    );
  }
}
