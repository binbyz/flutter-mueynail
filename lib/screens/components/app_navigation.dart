import 'package:flutter/material.dart';
import 'package:mueynail/constants/color.dart';
import 'package:mueynail/constants/style.dart';

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
          BottomNavigationBarItem(icon: Icon(Icons.face_3_outlined), label: '홈 화면'),
          BottomNavigationBarItem(icon: Icon(Icons.sms_outlined), label: '문의하기'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today_outlined), label: '예약하기'),
          BottomNavigationBarItem(icon: Icon(Icons.fingerprint_outlined), label: '내 정보'),
        ],
      ),
    );
  }
}
