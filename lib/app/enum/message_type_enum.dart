enum MessageTypeEnum {
  sender('sender'),
  receiver('receiver');

  const MessageTypeEnum(this.type);
  final String type;

  factory MessageTypeEnum.fromString(String type) {
    return MessageTypeEnum.values.firstWhere((element) => element.type == type);
  }
}