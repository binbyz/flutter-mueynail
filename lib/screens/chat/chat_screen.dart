import 'package:flutter/material.dart';
import 'package:mueynail/app/entities/reservation/message_dto.dart';
import 'package:mueynail/app/enum/message_type_enum.dart';

import 'chat_app_bar.dart';
import 'components/bubble.dart';
import 'components/chat_input.dart';

class ChatScreen extends StatefulWidget {

  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _controller = ScrollController();

  final List<MessageDto> _messages = [
    const MessageDto(content: "1", type: MessageTypeEnum.receiver),
    const MessageDto(content: "2", type: MessageTypeEnum.receiver),
    const MessageDto(content: "3겸댕몬 겸댕몬 겸댕몬 겸댕몬", type: MessageTypeEnum.sender),
    const MessageDto(content: "4겸댕몬겸댕몬겸댕몬겸댕몬겸댕몬겸댕몬겸댕몬", type: MessageTypeEnum.receiver),
    const MessageDto(content: "5겸댕몬", type: MessageTypeEnum.receiver),
    const MessageDto(content: "6Hello, 겸댕몬", type: MessageTypeEnum.sender),
    const MessageDto(content: "7겸댕몬", type: MessageTypeEnum.receiver),
    const MessageDto(content: "8겸댕몬겸댕몬겸댕몬겸댕몬", type: MessageTypeEnum.receiver),
    const MessageDto(content: "9겸댕몬겸댕몬겸댕몬겸댕몬겸댕몬겸댕몬겸댕몬겸댕몬겸댕몬", type: MessageTypeEnum.receiver),
    const MessageDto(content: "10겸댕몬", type: MessageTypeEnum.sender),
    const MessageDto(content: "11겸댕몬", type: MessageTypeEnum.receiver),
    const MessageDto(content: "12겸댕몬겸댕몬겸댕몬겸댕몬겸댕몬", type: MessageTypeEnum.receiver),
    const MessageDto(content: "13겸댕몬겸댕몬겸댕몬겸댕몬", type: MessageTypeEnum.sender),
    const MessageDto(content: "14겸댕몬겸댕몬겸댕몬겸댕몬", type: MessageTypeEnum.sender),
    const MessageDto(content: "15겸댕몬겸댕몬겸댕몬겸댕몬", type: MessageTypeEnum.sender),
    const MessageDto(content: "16겸댕몬겸댕몬겸댕몬겸댕몬", type: MessageTypeEnum.sender),
    const MessageDto(content: "17겸댕몬겸댕몬겸댕몬겸댕몬", type: MessageTypeEnum.sender),
    const MessageDto(content: "18겸댕몬겸댕몬겸댕몬겸댕몬", type: MessageTypeEnum.sender),
    const MessageDto(content: "19겸댕몬겸댕몬겸댕몬겸댕몬", type: MessageTypeEnum.sender),
    const MessageDto(content: "20겸댕몬겸댕몬겸댕몬겸댕몬", type: MessageTypeEnum.sender),
    const MessageDto(content: "20겸댕몬겸댕몬겸댕몬겸댕몬", type: MessageTypeEnum.sender),
    const MessageDto(content: "20겸댕몬겸댕몬겸댕몬겸댕몬", type: MessageTypeEnum.sender),
    const MessageDto(content: "20겸댕몬겸댕몬겸댕몬겸댕몬", type: MessageTypeEnum.sender),
    const MessageDto(content: "20겸댕몬겸댕몬겸댕몬겸댕몬", type: MessageTypeEnum.sender),
    const MessageDto(content: "99겸댕몬겸댕몬겸댕몬겸댕몬", type: MessageTypeEnum.sender),
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
