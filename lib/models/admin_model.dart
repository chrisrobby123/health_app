import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Admin {
  final String id;
  final String email;
  final String username;
  final String uid;
  final String contact;
  final bool isOnline;
  final String profilePic;
  final String specialty;
  final String role;
  Admin({
    required this.id,
    required this.email,
    required this.username,
    required this.uid,
    required this.contact,
    required this.isOnline,
    required this.profilePic,
    required this.specialty,
    required this.role,
  });

  Admin copyWith({
    String? id,
    String? email,
    String? username,
    String? uid,
    String? contact,
    bool? isOnline,
    String? profilePic,
    String? specialty,
    String? role,
  }) {
    return Admin(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
      uid: uid ?? this.uid,
      contact: contact ?? this.contact,
      isOnline: isOnline ?? this.isOnline,
      profilePic: profilePic ?? this.profilePic,
      specialty: specialty ?? this.specialty,
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
      'specialty': specialty,
      'role': role,
    };
  }

  factory Admin.fromMap(Map<String, dynamic> map) {
    return Admin(
      id: map['id'] as String,
      email: map['email'] as String,
      username: map['username'] as String,
      uid: map['uid'] as String,
      contact: map['contact'] as String,
      isOnline: map['isOnline'] as bool,
      profilePic: map['profilePic'] as String,
      specialty: map['specialty'] as String,
      role: map['role'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Admin.fromJson(String source) =>
      Admin.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Admin(id: $id, email: $email, username: $username, uid: $uid, contact: $contact, isOnline: $isOnline, profilePic: $profilePic, specialty: $specialty, role: $role)';
  }

  @override
  bool operator ==(covariant Admin other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.email == email &&
        other.username == username &&
        other.uid == uid &&
        other.contact == contact &&
        other.isOnline == isOnline &&
        other.profilePic == profilePic &&
        other.specialty == specialty &&
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
        specialty.hashCode ^
        role.hashCode;
  }
}
