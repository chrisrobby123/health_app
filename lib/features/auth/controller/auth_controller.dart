// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/features/auth/repository/auth_respository.dart';
import 'package:health_app/models/admin_model.dart';
import 'package:health_app/models/user_model.dart';

final authControllerProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(authRepository: authRepository);
});

final userDataProvider = FutureProvider((ref) {
  final userData = ref.watch(authControllerProvider);
  return userData.getUserData();
});

final allUsersStreamProvider = StreamProvider((ref) {
  final authController = ref.read(authControllerProvider);
  return authController.getAllUsers();
});

final getAdminStreamProvider = StreamProvider((ref) {
  final authController = ref.watch(authControllerProvider);
  return authController.getAdminUsers();
});

final currentAdminDetailsProvider = FutureProvider((ref) {
  final authController = ref.watch(authControllerProvider);
  return authController.getCurrentAdminData();
});
final currentUserDetailsProvider = FutureProvider((ref) {
  final authController = ref.watch(authControllerProvider);
  return authController.getCurrentUserData();
});

class AuthController {
  final AuthRepository authRepository;
  AuthController({
    required this.authRepository,
  });

  String? get username {
    return authRepository.username;
  }

  Future<dynamic> getCurrentUserData() async {
    return authRepository.getCurrentUserData();
  }

  Future<Admin> getCurrentAdminData() async {
    return authRepository.getCurrentAdminData();
  }

  Stream<List<Admin>> getAdminUsers() {
    return authRepository.getAdminUsers();
  }

  Stream<List<UserModel>> getAllUsers() {
    return authRepository.getAllUsers();
  }

  Future<UserModel?> getUserData() async {
    UserModel? user = await authRepository.getUserData();
    return user;
  }

  void signUpWithEmailAndPassword(BuildContext context, String email,
      String password, String username, String contact) {
    authRepository.signUpWithEmailAndPassword(
        context, email, password, username, contact);
  }

  void signInWithEmailAndPassword(
      BuildContext context, String email, String password) {
    authRepository.signInWithEmailAndPassword(context, email, password);
  }

  void signOut(BuildContext context) async {
    authRepository.signOut(context);
  }
}
