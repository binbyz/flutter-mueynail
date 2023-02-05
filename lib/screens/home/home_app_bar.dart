import 'package:flutter/material.dart';
import 'package:mueynail/constants/style.dart';
import 'package:mueynail/constants/value.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      titleTextStyle: brandTextStyle.copyWith(fontSize: 18),
      title: const Text(valueBrand),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
