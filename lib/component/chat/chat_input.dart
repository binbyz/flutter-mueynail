import 'package:flutter/material.dart';
import 'package:mueynail/const/color.dart';

class ChatInput extends StatelessWidget {
  const ChatInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, bottom: 10, top: 10, right: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.black12, width: 0.5),
          bottom: BorderSide(color: Colors.black12, width: 0.5),
        ),
      ),
      height: 50,
      width: double.infinity,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Icon(Icons.photo, color: Colors.white, size: 18),
            ),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: TextField(
              style: TextStyle(
                fontSize: 14,
                height: 1,
              ),
              decoration: InputDecoration(
                hintText: "문의하기",
                hintStyle: TextStyle(color: Colors.black54),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 25,
            height: 25,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: primaryColor,
              elevation: 0,
              child: const Icon(Icons.arrow_upward_rounded, color: Colors.white, size: 18),
            ),
          ),
        ],
      ),
    );
  }
}
