// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/core/commons/enum.dart';
import 'package:health_app/core/commons/utils.dart';
import 'package:health_app/models/chat_display.dart';
import 'package:health_app/models/medical_model.dart';
import 'package:health_app/models/message_model.dart';
import 'package:health_app/models/user_model.dart';
import 'package:health_app/providers/firebase_providers.dart';
import 'package:uuid/uuid.dart';

final medicalRepositoryProvider = Provider(
  (ref) => MedicalRepository(
    firestore: ref.read(fireStoreProvider),
    auth: ref.read(authProvider),
  ),
);

class MedicalRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  MedicalRepository({
    required this.firestore,
    required this.auth,
  });

  void _saveDataToUsersSubCollection(
    UserModel senderUserData,
    UserModel receiverUserData,
    String text,
    DateTime timeSent,
    String receiverUserId,
  ) async {
    var receiverChatDetails = ChatDisplay(
      name: senderUserData.username,
      profilePic: senderUserData.profilePic,
      timeSent: timeSent,
      userId: senderUserData.uid,
      lastMessage: text,
    );

    await firestore
        .collection('users')
        .doc(receiverUserId)
        .collection('medicals')
        .doc(auth.currentUser!.uid)
        .set(
          receiverChatDetails.toMap(),
        );

    var senderChatDetails = ChatDisplay(
      name: receiverUserData.username,
      profilePic: receiverUserData.profilePic,
      timeSent: timeSent,
      userId: senderUserData.uid,
      lastMessage: text,
    );

    await firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('medicals')
        .doc(receiverUserId)
        .set(
          senderChatDetails.toMap(),
        );
  }

  void _saveMessageToMessageSubCollection({
    required String receiverUserId,
    required String text,
    required DateTime timeSent,
    required String messageId,
    required String username,
    required String receiverUsername,
    required MessageEnum messageType,
  }) async {
    final message = Message(
      id: DateTime.now().toString(),
      receiverId: receiverUserId,
      senderId: auth.currentUser!.uid,
      type: messageType,
      messageId: messageId,
      isSeen: false,
      text: text,
      createdAt: DateTime.now(),
    );

    //message we sent
    await firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('medicals')
        .doc(receiverUserId)
        .collection('messages')
        .doc(messageId)
        .set(message.toMap());

//message we receive
    await firestore
        .collection('users')
        .doc(receiverUserId)
        .collection('medicals')
        .doc(auth.currentUser!.uid)
        .collection('messages')
        .doc(messageId)
        .set(message.toMap());
  }

  void sendMedicalMessage(BuildContext context, String name, String contact,
      String helpDetails, String receiverUserId, UserModel senderUser) async {
    try {
      var timeSent = DateTime.now();
      UserModel receiverUserData;
      var userDataMap =
          await firestore.collection('users').doc(receiverUserId).get();
      receiverUserData = UserModel.fromMap(userDataMap.data()!);
      var messageId = const Uuid().v1();

      _saveDataToUsersSubCollection(
        senderUser,
        receiverUserData,
        helpDetails,
        timeSent,
        receiverUserId,
      );

      _saveMessageToMessageSubCollection(
        receiverUserId: receiverUserId,
        text: helpDetails,
        timeSent: timeSent,
        messageType: MessageEnum.text,
        messageId: messageId,
        username: senderUser.username,
        receiverUsername: receiverUserData.username,
      );

      //   MedicalModel medical = MedicalModel(
      //   name: name,
      //   contact: contact,
      //   helpDetails: helpDetails,
      //   uid:,
      //   timeSent: timeSent.toString(),
      //   profilePic: ,
      // );
    } catch (e) {
      showSnackBar(context, e.toString());
    }

    //  final messageId = const Uuid().v1();

    // await firestore.collection('medicals').doc().set(medical.toMap());
    // await firestore
    //     .collection('medicals')
    //     .doc(auth.currentUser!.uid)
    //     .collection('medical messages')
    //     .doc(messageId)
    //     .set(medical.toMap());
  }
}
