import 'package:flutter/material.dart';
import 'package:mueynail/constants/color.dart';
import 'package:mueynail/constants/style.dart';

class CommonAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  const CommonAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: primaryColor,
      titleTextStyle: brandTextStyle.copyWith(fontSize: 18),
      title: Text(title),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
