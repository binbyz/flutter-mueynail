import 'package:mueynail/app/enum/message_type_enum.dart';

class MessageModel {
  final String content;
  final MessageTypeEnum type;

  const MessageModel({required this.content, required this.type});
}
