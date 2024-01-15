// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String id;
  final String email;
  final String username;
  final String uid;
  final String contact;
  final bool isOnline;
  final String profilePic;
  final String role;
  UserModel({
    required this.id,
    required this.email,
    required this.username,
    required this.uid,
    required this.contact,
    required this.isOnline,
    required this.profilePic,
    required this.role,
  });

  UserModel copyWith({
    String? id,
    String? email,
    String? username,
    String? uid,
    String? contact,
    bool? isOnline,
    String? profilePic,
    String? role,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
      uid: uid ?? this.uid,
      contact: contact ?? this.contact,
      isOnline: isOnline ?? this.isOnline,
      profilePic: profilePic ?? this.profilePic,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'username': username,
      'uid': uid,
      'contact': contact,
      'isOnline': isOnline,
      'profilePic': profilePic,
      'role': role,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      email: map['email'] as String,
      username: map['username'] as String,
      uid: map['uid'] as String,
      contact: map['contact'] as String,
      isOnline: map['isOnline'] as bool,
      profilePic: map['profilePic'] as String,
      role: map['role'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, email: $email, username: $username, uid: $uid, contact: $contact, isOnline: $isOnline, profilePic: $profilePic, role: $role)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.email == email &&
        other.username == username &&
        other.uid == uid &&
        other.contact == contact &&
        other.isOnline == isOnline &&
        other.profilePic == profilePic &&
        other.role == role;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        username.hashCode ^
        uid.hashCode ^
        contact.hashCode ^
        isOnline.hashCode ^
        profilePic.hashCode ^
        role.hashCode;
  }
}
