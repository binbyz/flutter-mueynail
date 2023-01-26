import 'package:mueynail/screen/chat/model/message_type_enum.dart';

class Message {
  final String content;
  final MessageType type;

  const Message({required this.content, required this.type});
}
