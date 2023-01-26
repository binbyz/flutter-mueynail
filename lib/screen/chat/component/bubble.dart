import 'package:flutter/material.dart';
import 'package:mueynail/const/color.dart';
import 'package:mueynail/screen/chat/model/message_model.dart';
import 'package:mueynail/screen/chat/model/message_type_enum.dart';

class Bubble extends StatelessWidget {
  final Message message;

  const Bubble({required this.message, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
      child: Align(
        alignment: (message.type == MessageType.receiver ? Alignment.topLeft : Alignment.topRight),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (message.type == MessageType.receiver ? Colors.black12 : primaryColor),
          ),
          padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
          child: Text(
            message.content,
            style: TextStyle(color: (message.type == MessageType.receiver ? Colors.black : Colors.white)),
          ),
        ),
      ),
    );
  }
}
