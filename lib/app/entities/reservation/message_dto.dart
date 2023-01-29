import 'package:mueynail/app/enum/message_type_enum.dart';

class MessageDto {
  final String content;
  final MessageType type;

  const MessageDto({required this.content, required this.type});
}