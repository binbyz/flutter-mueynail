import 'package:flutter/material.dart';
import 'package:mueynail/screen/chat/component/bubble.dart';
import 'package:mueynail/screen/chat/component/chat_app_bar.dart';
import 'package:mueynail/screen/chat/component/chat_input.dart';
import 'package:mueynail/screen/chat/model/message_model.dart';
import 'package:mueynail/screen/chat/model/message_type_enum.dart';

class ChatScreen extends StatefulWidget {

  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _controller = ScrollController();

  final List<Message> _messages = [
    const Message(content: "1", type: MessageType.receiver),
    const Message(content: "2", type: MessageType.receiver),
    const Message(content: "3겸댕몬 겸댕몬 겸댕몬 겸댕몬", type: MessageType.sender),
    const Message(content: "4겸댕몬겸댕몬겸댕몬겸댕몬겸댕몬겸댕몬겸댕몬", type: MessageType.receiver),
    const Message(content: "5겸댕몬", type: MessageType.receiver),
    const Message(content: "6Hello, 겸댕몬", type: MessageType.sender),
    const Message(content: "7겸댕몬", type: MessageType.receiver),
    const Message(content: "8겸댕몬겸댕몬겸댕몬겸댕몬", type: MessageType.receiver),
    const Message(content: "9겸댕몬겸댕몬겸댕몬겸댕몬겸댕몬겸댕몬겸댕몬겸댕몬겸댕몬", type: MessageType.receiver),
    const Message(content: "10겸댕몬", type: MessageType.sender),
    const Message(content: "11겸댕몬", type: MessageType.receiver),
    const Message(content: "12겸댕몬겸댕몬겸댕몬겸댕몬겸댕몬", type: MessageType.receiver),
    const Message(content: "13겸댕몬겸댕몬겸댕몬겸댕몬", type: MessageType.sender),
    const Message(content: "14겸댕몬겸댕몬겸댕몬겸댕몬", type: MessageType.sender),
    const Message(content: "15겸댕몬겸댕몬겸댕몬겸댕몬", type: MessageType.sender),
    const Message(content: "16겸댕몬겸댕몬겸댕몬겸댕몬", type: MessageType.sender),
    const Message(content: "17겸댕몬겸댕몬겸댕몬겸댕몬", type: MessageType.sender),
    const Message(content: "18겸댕몬겸댕몬겸댕몬겸댕몬", type: MessageType.sender),
    const Message(content: "19겸댕몬겸댕몬겸댕몬겸댕몬", type: MessageType.sender),
    const Message(content: "20겸댕몬겸댕몬겸댕몬겸댕몬", type: MessageType.sender),
    const Message(content: "20겸댕몬겸댕몬겸댕몬겸댕몬", type: MessageType.sender),
    const Message(content: "20겸댕몬겸댕몬겸댕몬겸댕몬", type: MessageType.sender),
    const Message(content: "20겸댕몬겸댕몬겸댕몬겸댕몬", type: MessageType.sender),
    const Message(content: "20겸댕몬겸댕몬겸댕몬겸댕몬", type: MessageType.sender),
    const Message(content: "99겸댕몬겸댕몬겸댕몬겸댕몬", type: MessageType.sender),
  ];

  void scrollDown() {
    _controller.animateTo(
      _controller.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChatAppBar(),
      body: Stack(
        children: [
          ListView.builder(
            controller: _controller,
            itemCount: _messages.length,
            reverse: true,
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10, bottom: 60),
            itemBuilder: (context, index) {
              return Bubble(message: _messages[index]);
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
