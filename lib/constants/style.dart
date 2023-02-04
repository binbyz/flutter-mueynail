import 'package:flutter/material.dart';
import 'package:mueynail/constants/color.dart';

const brandTextStyle = TextStyle(
  color: primaryColor,
  fontSize: 18,
  fontWeight: FontWeight.w700,
  letterSpacing: -0.5,
);

final navigationTextStyle = brandTextStyle.copyWith(
  fontSize: 12,
  fontWeight: FontWeight.w500,
);

final normalTextStyle = brandTextStyle.copyWith(
  fontSize: 16,
  color: Colors.black87,
  fontWeight: FontWeight.w500,
);

final titleTextStyle = brandTextStyle.copyWith(
  fontSize: 20,
  fontWeight: FontWeight.w700,
  letterSpacing: -1.5,
);

const summaryTextStyle = TextStyle(
  color: Colors.black45,
  fontSize: 13,
  letterSpacing: -1.0,
);

final positiveBoxDecoration = BoxDecoration(
  color: Colors.white,
  border: Border.all(color: primaryColor),
  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
  boxShadow: [
    BoxShadow(color: primaryColor.withOpacity(0.3), spreadRadius: 2, blurRadius: 1, offset: const Offset(0, 0)),
  ],
);

final negativeBoxDecoration = BoxDecoration(
  color: Colors.white,
  border: Border.all(color: Colors.black38),
  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
  boxShadow: [
    BoxShadow(color: Colors.grey.withOpacity(0.3), spreadRadius: 2, blurRadius: 1, offset: const Offset(0, 0)),
  ],
);

final negativeTextStyle = titleTextStyle.copyWith(color: Colors.black45);
final positiveTextStyle = titleTextStyle;