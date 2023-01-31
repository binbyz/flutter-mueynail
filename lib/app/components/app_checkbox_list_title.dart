import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mueynail/constants/color.dart';

class AppCheckboxListTitle extends StatefulWidget {
  final String label;
  final Icon? icon;
  final int? price;
  final List<Widget>? children;
  final Color? depthColor;
  final ListTileControlAffinity affinity;

  const AppCheckboxListTitle({
    Key? key,
    required this.label,
    this.icon,
    this.price,
    this.children,
    this.depthColor,
    this.affinity = ListTileControlAffinity.leading,
  }) : super(key: key);

  @override
  State<AppCheckboxListTitle> createState() => _AppCheckboxListTitleState();
}

class _AppCheckboxListTitleState extends State<AppCheckboxListTitle> {
  bool value = Random().nextInt(10) % 2 == 0 ? true : false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: widget.depthColor != null
              ? BorderSide(color: widget.depthColor!)
              : const BorderSide(color: Colors.transparent),
        ),
      ),
      child: Column(
        children: [
          CheckboxListTile(
            checkColor: Colors.white,
            activeColor: primaryColor,
            title: Row(
              children: [
                Text(
                  widget.label,
                  style: value
                      ? const TextStyle(color: primaryColor, fontWeight: FontWeight.w700)
                      : const TextStyle(color: Colors.black45),
                ),
                if (widget.price != null)
                  Text(
                    ' (${widget.price}원)',
                    style: const TextStyle(color: Colors.black54, fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  )
                else
                  const SizedBox(width: 0),
              ],
            ),
            secondary: (widget.icon != null)
                ? Icon(
                    Icons.shopping_cart_outlined,
                    color: value ? primaryColor : Colors.black45,
                  )
                : const SizedBox(),
            value: value,
            onChanged: (newValue) {
              value = !value;
            },
            controlAffinity: widget.affinity,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Column(
              children: [...?widget.children],
            ),
          ),
        ],
      ),
    );
  }
}
