// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/features/auth/controller/auth_controller.dart';
import 'package:health_app/features/auth/repository/auth_respository.dart';
import 'package:health_app/features/chat/repository/chat_repository.dart';
import 'package:health_app/models/chat_display.dart';
import 'package:health_app/models/message_model.dart';
import 'package:health_app/models/user_model.dart';

final specialistToChatStreamProvider = StreamProvider((ref) {
  final chatController = ref.watch(chatControllerProvider);
  return chatController.getSpecialistUsers();
});

final chatStreamProvider = StreamProvider((ref) {
  final chatRepository = ref.watch(chatControllerProvider);
  return chatRepository.getChatMessages();
});

final chatDisplayStreamProvider = StreamProvider((ref) {
  final chatRepository = ref.watch(chatControllerProvider);
  return chatRepository.getChatDisplay();
});

final chatControllerProvider = Provider((ref) {
  final chatrep = ref.watch(chatRepositoryProvider);
  return ChatController(chatRepository: chatrep, ref: ref);
});

class ChatController {
  final ChatRepository chatRepository;
  final ProviderRef ref;
  ChatController({required this.chatRepository, required this.ref});

  Stream<List<UserModel>> getSpecialistUsers() {
    return chatRepository.getSpecialistUsers();
  }

  void sendMessage(
    BuildContext context,
    String text,
    String receiverUserId,
  ) {
    ref.read(userDataProvider).whenData((value) => chatRepository.sendMessage(
          context,
          text,
          receiverUserId,
          value!,
        ));
  }

  Stream<List<ChatDisplay>> getChatDisplay() {
    return chatRepository.getChatDisplay();
  }

  Stream<List<Message>> getChatMessages() {
    return chatRepository.getChatMessages();
  }
}
