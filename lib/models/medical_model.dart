// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MedicalModel {
  final String name;
  final String contact;
  final String helpDetails;
  final String uid;
  final String timeSent;
  final String profilePic;
  MedicalModel({
    required this.name,
    required this.contact,
    required this.helpDetails,
    required this.uid,
    required this.timeSent,
    required this.profilePic,
  });

  MedicalModel copyWith({
    String? name,
    String? contact,
    String? helpDetails,
    String? uid,
    String? timeSent,
    String? profilePic,
  }) {
    return MedicalModel(
      name: name ?? this.name,
      contact: contact ?? this.contact,
      helpDetails: helpDetails ?? this.helpDetails,
      uid: uid ?? this.uid,
      timeSent: timeSent ?? this.timeSent,
      profilePic: profilePic ?? this.profilePic,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'contact': contact,
      'helpDetails': helpDetails,
      'uid': uid,
      'timeSent': timeSent,
      'profilePic': profilePic,
    };
  }

  factory MedicalModel.fromMap(Map<String, dynamic> map) {
    return MedicalModel(
      name: map['name'] as String,
      contact: map['contact'] as String,
      helpDetails: map['helpDetails'] as String,
      uid: map['uid'] as String,
      timeSent: map['timeSent'] as String,
      profilePic: map['profilePic'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MedicalModel.fromJson(String source) =>
      MedicalModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MedicalModel(name: $name, contact: $contact, helpDetails: $helpDetails, uid: $uid, timeSent: $timeSent, profilePic: $profilePic)';
  }

  @override
  bool operator ==(covariant MedicalModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.contact == contact &&
        other.helpDetails == helpDetails &&
        other.uid == uid &&
        other.timeSent == timeSent &&
        other.profilePic == profilePic;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        contact.hashCode ^
        helpDetails.hashCode ^
        uid.hashCode ^
        timeSent.hashCode ^
        profilePic.hashCode;
  }
}
