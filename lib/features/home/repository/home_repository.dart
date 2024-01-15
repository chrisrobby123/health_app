// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/models/medical_model.dart';

import 'package:health_app/models/quote.dart';

final homeRepositoryProvider = Provider((ref) => HomeRepository(
      firebaseFirestore: FirebaseFirestore.instance,
      auth: FirebaseAuth.instance,
    ));

class HomeRepository {
  final Dio _dio = Dio();
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth auth;

  HomeRepository({required this.firebaseFirestore, required this.auth});

  var url = 'https://api.api-ninjas.com/v1/quotes?category=fitness';

  Future<Quote> getRecipe() async {
    var token = 'ZRPGJX1FG+pKkJ5o9F+vEA==hT5rMKsgvJdQU7zB';
    // var params = {'X-Api-Key': 'ZRPGJX1FG+pKkJ5o9F+vEA==hT5rMKsgvJdQU7zB'};
    //var data = _dio.options.headers['X-Api-Key'] = 'Bearer $token';
    Response response = await _dio.get(url,
        queryParameters: {'limit': 10},
        options: Options(headers: {'X-Api-Key': token}));
    Quote quote = Quote.fromJson(response.data);
    print(response.data);
    return quote;

    // Response response =
  }

  updateProfile(String contact) async {
    await firebaseFirestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .update({'contact': contact});
  }

  //Future<List<MedicalModel>> usersMessages()async {

  // final doc =  await firebaseFirestore.collection('chats').doc(auth.currentUser!.uid).get();
  //basically from the syntax, every time a users sends another message
  //it gets overridden, and therefore you wont be able to fetch other messages
  //so to fix that, what you do is, you create another collection with a unique id
  // hence every message the user sends has it own documents
  // with the syntax, firebaseFirestore.collection('chats').doc(auth.currentUser!.uid).collection().snapshots
  //.map(
  // List<MedicalModel> messages = [];
  //(e) {
  // for (var doc in e){
  // messages.add(doc.data())
  // }
  // messages.add(e)
  //})
  //

  // }
}
