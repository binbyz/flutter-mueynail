import 'package:flutter/material.dart';
import 'package:mueynail/app/enum/art_enum.dart';
import 'package:mueynail/constants/color.dart';

class BoxCategory extends StatelessWidget {
  final Function tapCallback;
  final ArtEnum design;
  final bool active;

  const BoxCategory({
    Key? key,
    required this.design,
    required this.tapCallback,
    required this.active,
  }) : super(key: key);

  static final BoxDecoration _enabledDecoration = BoxDecoration(
    color: Colors.white,
    border: Border.all(color: primaryColor, width: 2),
    borderRadius: const BorderRadius.all(Radius.circular(10)),
  );

  static final BoxDecoration _disabledDecoration = BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Colors.black38, width: 0.5),
    borderRadius: const BorderRadius.all(Radius.circular(10)),
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        tapCallback(design);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: 100,
        decoration: active ? _enabledDecoration : _disabledDecoration,
        child: Center(
          child: Text(
            design.label,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: active ? primaryColor : Colors.black45,
            ),
          ),
        ),
      ),
    );
  }
}
