import 'package:health_app/core/commons/enum.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Message {
  final String id;
  final String receiverId;
  final String senderId;
  final MessageEnum type;
  final String messageId;
  final bool isSeen;
  final String text;
  final DateTime createdAt;

  Message({
    required this.id,
    required this.receiverId,
    required this.senderId,
    required this.type,
    required this.messageId,
    required this.isSeen,
    required this.text,
    required this.createdAt,
  });

  Message copyWith({
    String? id,
    String? receiverId,
    String? senderId,
    MessageEnum? type,
    String? messageId,
    bool? isSeen,
    String? text,
    DateTime? createdAt,
  }) {
    return Message(
      id: id ?? this.id,
      receiverId: receiverId ?? this.receiverId,
      senderId: senderId ?? this.senderId,
      type: type ?? this.type,
      messageId: messageId ?? this.messageId,
      isSeen: isSeen ?? this.isSeen,
      text: text ?? this.text,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'receiverId': receiverId,
      'senderId': senderId,
      'type': type.type,
      'messageId': messageId,
      'isSeen': isSeen,
      'text': text,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      id: map['id'] as String,
      receiverId: map['receiverId'] as String,
      senderId: map['senderId'] as String,
      type: (map['type'] as String).toEnum(),
      messageId: map['messageId'] as String,
      isSeen: map['isSeen'] as bool,
      text: map['text'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
    );
  }

  @override
  String toString() {
    return 'Message(id: $id, receiverId: $receiverId, senderId: $senderId, type: $type, messageId: $messageId, isSeen: $isSeen, text: $text, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant Message other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.receiverId == receiverId &&
        other.senderId == senderId &&
        other.type == type &&
        other.messageId == messageId &&
        other.isSeen == isSeen &&
        other.text == text &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        receiverId.hashCode ^
        senderId.hashCode ^
        type.hashCode ^
        messageId.hashCode ^
        isSeen.hashCode ^
        text.hashCode ^
        createdAt.hashCode;
  }
}
