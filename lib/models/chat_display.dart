// ignore_for_file: public_member_api_docs, sort_constructors_first
class ChatDisplay {
  final String name;
  final String profilePic;
  final DateTime timeSent;
  final String userId;
  final String lastMessage;
  ChatDisplay({
    required this.name,
    required this.profilePic,
    required this.timeSent,
    required this.userId,
    required this.lastMessage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'profilePic': profilePic,
      'timeSent': timeSent.millisecondsSinceEpoch,
      'userId': userId,
      'lastMessage': lastMessage,
    };
  }

  factory ChatDisplay.fromMap(Map<String, dynamic> map) {
    return ChatDisplay(
      name: map['name'] as String,
      profilePic: map['profilePic'] as String,
      timeSent: DateTime.fromMillisecondsSinceEpoch(map['timeSent'] as int),
      userId: map['userId'] as String,
      lastMessage: map['lastMessage'] as String,
    );
  }
}
