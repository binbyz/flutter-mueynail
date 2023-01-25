import 'package:flutter/material.dart';
import 'package:mueynail/const/style.dart';

class ContentBox extends StatelessWidget {
  final String title;
  final Widget children;
  final double contentPadding;

  const ContentBox({Key? key, required this.title, required this.children, this.contentPadding = 10}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 15),
          child: Text(title, style: titleTextStyle, textAlign: TextAlign.start),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: contentPadding),
          child: children,
        ),
      ],
    );
  }
}
