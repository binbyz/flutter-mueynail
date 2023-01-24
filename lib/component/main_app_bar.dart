import 'package:flutter/material.dart';
import 'package:mueynail/const/style.dart';
import 'package:mueynail/const/value.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      forceElevated: true,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(valueBrand, style: brandTextStyle.copyWith(fontSize: 18)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
