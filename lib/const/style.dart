import 'package:flutter/material.dart';
import 'package:mueynail/const/color.dart';

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

final titleTextStyle = brandTextStyle.copyWith(
  fontSize: 20,
  fontWeight: FontWeight.w700,
  letterSpacing: -1,
);

final positiveBoxDecoration = BoxDecoration(
  border: Border.all(
    width: 1,
    color: primaryColor,
  ),
  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
);

final negativeBoxDecoration = BoxDecoration(
  border: Border.all(
    width: 1,
    color: Colors.grey,
  ),
  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
);
