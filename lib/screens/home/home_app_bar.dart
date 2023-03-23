import 'package:flutter/material.dart';
import 'package:mueynail/constants/style.dart';

class HomeAppBar extends StatefulWidget with PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      titleTextStyle: brandTextStyle.copyWith(fontSize: 18),
      title: Text(
        '뮤이네일',
        style: brandTextStyle.copyWith(fontSize: 18),
      ),
      leading: GestureDetector(
        child: const Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
            child: Text('매장선택', style: summaryTextStyle),
          ),
        ),
      ),
    );
  }
}
