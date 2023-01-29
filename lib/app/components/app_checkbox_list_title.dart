import 'package:flutter/material.dart';
import 'package:mueynail/constants/color.dart';

class AppCheckboxListTitle extends StatefulWidget {
  final String label;
  final List<Widget>? children;
  final String? image;

  const AppCheckboxListTitle({Key? key, required this.label, this.children, this.image}) : super(key: key);

  @override
  State<AppCheckboxListTitle> createState() => _AppCheckboxListTitleState();
}

class _AppCheckboxListTitleState extends State<AppCheckboxListTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          checkColor: Colors.white,
          activeColor: primaryColor,
          title: Text(widget.label),
          secondary: Icon(Icons.shopping_cart_checkout_rounded),
          value: true,
          onChanged: (newValue) {},
          controlAffinity: ListTileControlAffinity.trailing,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            children: [...?widget.children],
          ),
        ),
      ],
    );
  }
}
