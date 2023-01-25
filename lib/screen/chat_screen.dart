import 'package:flutter/material.dart';
import 'package:mueynail/component/chat/bubble.dart';
import 'package:mueynail/component/chat/chat_input.dart';
import 'package:mueynail/model/chat/message_model.dart';

import '../component/main_app_bar.dart';

final List<Message> messages = [
  const Message(content: "1", type: "receiver"),
  const Message(content: "2", type: "receiver"),
  const Message(content: "3겸댕몬 겸댕몬 겸댕몬 겸댕몬", type: "sender"),
  const Message(content: "4겸댕몬겸댕몬겸댕몬겸댕몬겸댕몬겸댕몬겸댕몬", type: "receiver"),
  const Message(content: "5겸댕몬", type: "receiver"),
  const Message(content: "6Hello, 겸댕몬", type: "sender"),
  const Message(content: "7겸댕몬", type: "receiver"),
  const Message(content: "8겸댕몬겸댕몬겸댕몬겸댕몬", type: "receiver"),
  const Message(content: "9겸댕몬겸댕몬겸댕몬겸댕몬겸댕몬겸댕몬겸댕몬겸댕몬겸댕몬", type: "receiver"),
  const Message(content: "10겸댕몬", type: "sender"),
  const Message(content: "11겸댕몬", type: "receiver"),
  const Message(content: "12겸댕몬겸댕몬겸댕몬겸댕몬겸댕몬", type: "receiver"),
  const Message(content: "13겸댕몬겸댕몬겸댕몬겸댕몬", type: "sender"),
  const Message(content: "14겸댕몬겸댕몬겸댕몬겸댕몬", type: "sender"),
  const Message(content: "15겸댕몬겸댕몬겸댕몬겸댕몬", type: "sender"),
  const Message(content: "16겸댕몬겸댕몬겸댕몬겸댕몬", type: "sender"),
  const Message(content: "17겸댕몬겸댕몬겸댕몬겸댕몬", type: "sender"),
  const Message(content: "18겸댕몬겸댕몬겸댕몬겸댕몬", type: "sender"),
  const Message(content: "19겸댕몬겸댕몬겸댕몬겸댕몬", type: "sender"),
  const Message(content: "20겸댕몬겸댕몬겸댕몬겸댕몬", type: "sender"),
];

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: messages.length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Bubble(message: messages[index]);
            },
          ),
          const Align(
            alignment: Alignment.bottomLeft,
            child: ChatInput(),
          ),
        ],
      ),
    );
  }
}
