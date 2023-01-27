import 'package:flutter/material.dart';
import 'package:mueynail/const/color.dart';
import 'package:mueynail/screen/reservation/model/design_enum.dart';

class ImageRadioItem extends StatelessWidget {
  final Function tapCallback;
  final Design design;
  final bool active;

  static final BoxDecoration _enabledDecoration = BoxDecoration(
    color: primaryColorDisabled,
    border: Border.all(color: primaryColor, width: 1),
    borderRadius: const BorderRadius.all(Radius.circular(10)),
  );

  static final BoxDecoration _disabledDecoration = BoxDecoration(
    color: Colors.grey,
    border: Border.all(color: Colors.black38, width: 1),
    borderRadius: const BorderRadius.all(Radius.circular(10)),
  );

  const ImageRadioItem({Key? key, required Design design, required Function tapCallback, required this.active}) : tapCallback = tapCallback, design = design, super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        tapCallback(design);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: 100,
        height: 100,
        decoration: active ? _enabledDecoration : _disabledDecoration,
        child: Center(
          child: Text(design.label),
        ),
      ),
    );
  }
}
