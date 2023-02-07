import 'package:flutter/material.dart';
import 'package:mueynail/app/components/common_app_bar.dart';
import 'package:mueynail/constants/color.dart';
import 'package:mueynail/constants/style.dart';
import 'package:mueynail/constants/value.dart';
import 'package:mueynail/screens/member/reservation_history_screen.dart';

class MemberScreen extends StatelessWidget {
  const MemberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: '내 정보'),
      body: ListView(
        children: [
          userNamePart(),
          pointPart(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: menuPart(context),
          ),
        ],
      ),
    );
  }

  Widget userNamePart() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Text('비즈', style: titleTextStyle.copyWith(fontSize: 24)),
            const SizedBox(width: 5),
            Text('고객님', style: summaryTextStyle.copyWith(fontSize: 20)),
          ]),
          Icon(Icons.settings, size: 24, color: Colors.black87.withOpacity(0.5)),
        ],
      ),
    );
  }

  Widget pointPart() {
    final subTitle = summaryTextStyle.copyWith(color: Colors.white.withOpacity(0.6), fontSize: 14);
    final valueTitle = brandTextStyle.copyWith(color: Colors.white);

    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('방문', style: subTitle),
                  Text('11', style: valueTitle),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('멤버쉽', style: subTitle),
                  Text('1 / 3', style: valueTitle),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('포인트', style: subTitle),
                  Text('4000', style: valueTitle),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget menuPart(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _menuPartTitle(valueBrand),
        _menuPartButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const ReservationHistoryScreen()),
            );
          },
          icon: Icons.history,
          label: '예약 내역',
        ),
        _menuPartButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const ReservationHistoryScreen()),
            );
          },
          icon: Icons.article_outlined,
          label: '후기 작성',
          description: '1000 포인트 지급',
        ),
        _menuPartButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const ReservationHistoryScreen()),
            );
          },
          icon: Icons.favorite_outline,
          label: '관심 아트',
        ),
        const SizedBox(height: 15),
        _menuPartTitle('기타'),
        _menuPartButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const ReservationHistoryScreen()),
            );
          },
          icon: Icons.person_search_outlined,
          label: '친구 초대',
          description: '3000 포인트 지급',
        ),
        _menuPartButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const ReservationHistoryScreen()),
            );
          },
          icon: Icons.exit_to_app_outlined,
          label: '회원 탈퇴',
          smallText: true,
        ),
      ],
    );
  }

  Widget _menuPartTitle(String title) {
    return Text(title, style: normalTextStyle.copyWith(color: Colors.black54, fontSize: 14));
  }

  Widget _menuPartButton({
    required VoidCallback onPressed,
    required IconData icon,
    required String label,
    String description = '',
    bool smallText = false,
  }) {
    final color = (smallText == false) ? primaryColor : Colors.black54;

    final textStyle = TextStyle(
      color: color,
      fontSize: (smallText == false) ? 18 : 12,
      fontWeight: (smallText == false) ? FontWeight.w500 : FontWeight.w200,
    );

    return TextButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 7),
          Text(label, style: textStyle),
          const SizedBox(width: 7),
          Text(description, style: summaryTextStyle)
        ],
      ),
    );
  }
}
