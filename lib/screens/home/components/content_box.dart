import 'package:flutter/material.dart';
import 'package:mueynail/constants/style.dart';

class ContentBox extends StatelessWidget {
  final String title;
  final Widget children;
  final double contentPadding;
  final bool visibleTitle;
  final double titleBottom;

  const ContentBox({
    Key? key,
    required this.title,
    required this.children,
    this.contentPadding = 10,
    this.visibleTitle = true,
    this.titleBottom = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double titleTopPadding = visibleTitle ? 20 : 5;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10, top: titleTopPadding, right: 10, bottom: titleBottom),
          child: Visibility(
            visible: visibleTitle,
            child: Text(title, style: titleTextStyle, textAlign: TextAlign.start),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: contentPadding),
          child: children,
        ),
      ],
    );
  }
}
