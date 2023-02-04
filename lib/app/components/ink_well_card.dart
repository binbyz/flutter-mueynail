import 'package:flutter/material.dart';
import 'package:mueynail/constants/color.dart';

class InkWellCard extends StatelessWidget {
  final Widget child;

  const InkWellCard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 150,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: primaryColorOpacity),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: child,
        ),
      ),
    );
  }
}
