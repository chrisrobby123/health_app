// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/core/commons/enum.dart';
import 'package:health_app/core/commons/utils.dart';
import 'package:health_app/models/chat_display.dart';

import 'package:health_app/models/message_model.dart';
import 'package:health_app/models/user_model.dart';
import 'package:health_app/providers/firebase_providers.dart';
import 'package:uuid/uuid.dart';

final chatRepositoryProvider = Provider(
  (ref) => ChatRepository(
    firestore: ref.read(fireStoreProvider),
    auth: ref.read(authProvider),
  ),
);

class ChatRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  ChatRepository({
    required this.firestore,
    required this.auth,
  });
  List<Message> messages = [];

  Stream<List<UserModel>> getSpecialistUsers() {
    return firestore.collection('users').snapshots().map((event) {
      List<UserModel> specialists = [];
      for (var doc in event.docs) {
        if (doc.data().keys.contains('isSpecialist') == true) {
          specialists.add(UserModel.fromMap(doc.data()));
        }
      }
      return specialists;
    });
  }

  Stream<List<ChatDisplay>> getChatDisplay() {
    return firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('chats')
        .snapshots()
        .asyncMap((event) async {
      List<ChatDisplay> chatDisplays = [];
      for (var doc in event.docs) {
        var chatDisplay = ChatDisplay.fromMap(doc.data());
        var userData =
            await firestore.collection('users').doc(chatDisplay.userId).get();
        var user = UserModel.fromMap(userData.data()!);
        chatDisplays.add(
          ChatDisplay(
            name: user.username,
            profilePic: user.profilePic,
            timeSent: chatDisplay.timeSent,
            userId: user.uid,
            lastMessage: chatDisplay.lastMessage,
          ),
        );
      }
      return chatDisplays;
    });
  }

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
        .collection('chats')
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
        .collection('chats')
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
        .collection('chats')
        .doc(receiverUserId)
        .collection('messages')
        .doc(messageId)
        .set(message.toMap());

//message we receive
    await firestore
        .collection('users')
        .doc(receiverUserId)
        .collection('chats')
        .doc(auth.currentUser!.uid)
        .collection('messages')
        .doc(messageId)
        .set(message.toMap());
  }

  void sendMessage(
    BuildContext context,
    String text,
    String receiverUserId,
    UserModel senderUser,
  ) async {
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
        text,
        timeSent,
        receiverUserId,
      );

      _saveMessageToMessageSubCollection(
        receiverUserId: receiverUserId,
        text: text,
        timeSent: timeSent,
        messageType: MessageEnum.text,
        messageId: messageId,
        username: senderUser.username,
        receiverUsername: receiverUserData.username,
      );
    } on FirebaseException catch (_) {
      rethrow;
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Stream<List<Message>> getChatMessages() {
    return firestore
        .collection('chats')
        .doc(auth.currentUser!.uid)
        .collection('chat Messages')
        .orderBy('createdAt')
        .snapshots()
        .map(
      (event) {
        List<Message> message = [];
        for (var doc in event.docs) {
          message.add(Message.fromMap(doc.data()));
        }
        return message;
      },
    );
  }
}
