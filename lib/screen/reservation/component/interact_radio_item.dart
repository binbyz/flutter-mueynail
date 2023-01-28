import 'package:flutter/material.dart';
import 'package:mueynail/const/color.dart';
import 'package:mueynail/screen/reservation/model/design_enum.dart';

class InteractRadioButton extends StatelessWidget {
  final Function tapCallback;
  final Design design;
  final bool active;

  static final BoxDecoration _enabledDecoration = BoxDecoration(
    color: primaryColorOpacity,
    border: Border.all(color: primaryColor, width: 2),
    borderRadius: const BorderRadius.all(Radius.circular(10)),
  );

  static final BoxDecoration _disabledDecoration = BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Colors.black38, width: 0.5),
    borderRadius: const BorderRadius.all(Radius.circular(10)),
  );

  const InteractRadioButton({Key? key, required this.design, required this.tapCallback, required this.active})
      : super(key: key);

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
          child: Text(design.label, style: const TextStyle(fontWeight: FontWeight.w700, color: primaryColor)),
        ),
      ),
    );
  }
}
