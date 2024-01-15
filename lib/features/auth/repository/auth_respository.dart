// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:health_app/core/commons/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/models/admin_model.dart';
import 'package:health_app/models/user_model.dart';
import 'package:health_app/providers/firebase_providers.dart';
import 'package:uuid/uuid.dart';

// typedef CheckAdmin = Admin;
// typedef Userr = UserModel;

// typedef checkuser = Either<CheckAdmin, Userr>;

final authRepositoryProvider = Provider((ref) => AuthRepository(
    auth: ref.read(authProvider), firestore: ref.read(fireStoreProvider)));

final authStateChangedProvider = StreamProvider((ref) {
  final auth = ref.watch(authProvider);
  return auth.authStateChanges();
});

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  AuthRepository({
    required this.auth,
    required this.firestore,
  });

  Stream<List<UserModel>> getAllUsers() {
    return firestore.collection('users').snapshots().map((event) {
      List<UserModel> users = [];
      for (var doc in event.docs) {
        users.add(
          UserModel.fromMap(
            doc.data(),
          ),
        );
      }
      return users;
    });
  }

  Future<Admin> getCurrentAdminData() async {
    final firebaseData =
        await firestore.collection('admin').doc(auth.currentUser!.uid).get();
    final adminData = firebaseData.data();
    Admin admin = Admin.fromMap(adminData!);
    return admin;
  }

  Future<dynamic> getCurrentUserData() async {
    dynamic user;
    if (user!.role == 'user') {
      final firebaseData =
          await firestore.collection('users').doc(auth.currentUser!.uid).get();
      final userData = firebaseData.data();
      user = UserModel.fromMap(userData!);
    }
    final firebaseData =
        await firestore.collection('admin').doc(auth.currentUser!.uid).get();
    final userData = firebaseData.data();
    user = Admin.fromMap(userData!);

    return user;
  }

  Stream<List<Admin>> getAdminUsers() {
    return firestore.collection('admin').snapshots().map((event) {
      List<Admin> admin = [];
      for (var doc in event.docs) {
        admin.add(
          Admin.fromMap(
            doc.data(),
          ),
        );
      }
      return admin;
    });
  }

  String? get username {
    return auth.currentUser!.displayName;
  }

  //final Future<UserModel?>  userData =  getUserData();

  Future<UserModel?> get userData {
    return getUserData();
  }

  Future<UserModel?> getUserData() async {
    var userDataMap =
        await firestore.collection('users').doc(auth.currentUser?.uid).get();
    UserModel? user;
    if (userDataMap.data() != null) {
      user = UserModel.fromMap(userDataMap.data()!);
    }

    return user;
  }

  // Future<UserModel?> fetchCurrentUser() async {
  //   var userData = awa
  // }

  String determineRole(String email) {
    if (email.endsWith('@admin.com')) {
      return 'admin';
    }
    return 'user';
  }

  String role = '';

  void signUpWithEmailAndPassword(BuildContext context, String email,
      String password, String username, String contact) async {
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      role = determineRole(email);

      if (role == 'admin') {
        var adminId = const Uuid().v1();
        final user = Admin(
          id: adminId,
          email: email,
          username: username,
          uid: userCredential.user!.uid,
          contact: contact,
          isOnline: false,
          profilePic: 'assets/images/user.png',
          specialty: '',
          role: role,
        );

        await firestore
            .collection('admin')
            .doc(userCredential.user!.uid)
            .set(user.toMap());
      } else {
        final user = UserModel(
          id: DateTime.now().toString(),
          email: email,
          username: username,
          uid: userCredential.user!.uid,
          contact: contact,
          isOnline: true,
          profilePic: 'assets/images/user.png',
          role: role,
        );
        await firestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .set(user.toMap());
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.toString());
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signInWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.message == 'email-already-exists') {
        showSnackBar(context, 'Email/Password');
      } else if (e.message == 'no-user-record') {
        showSnackBar(context, 'User is not registered.');
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signOut(BuildContext context) async {
    try {
      await auth.signOut();
    } on FirebaseAuthException catch (_) {
      rethrow;
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
  }

  Stream<User?> get authState {
    return auth.authStateChanges();
  }

  User? get currUser {
    return auth.currentUser;
  }
  // Stream<UserModel> getUserModel(){

  // }

  void googleSignUp() {}
}
