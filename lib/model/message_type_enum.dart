enum MessageType {
  sender('sender'),
  receiver('receiver');

  const MessageType(this.type);
  final String type;

  factory MessageType.fromString(String type) {
    return MessageType.values.firstWhere((element) => element.type == type);
  }
}