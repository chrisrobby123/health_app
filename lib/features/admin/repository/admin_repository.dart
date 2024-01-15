// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/features/medicals/screens/medical_card_screen.dart';
import 'package:health_app/models/medical_model.dart';
import 'package:health_app/models/user_model.dart';
import 'package:health_app/providers/firebase_providers.dart';

final adminRepositoryProvider = Provider(
  (ref) => AdminRepository(
    firestore: ref.read(fireStoreProvider),
  ),
);

final helpDetailsStreamProvider = StreamProvider<MedicalModel?>(
  (ref) => ref.watch(adminRepositoryProvider).helpMess,
);

class AdminRepository {
  final FirebaseFirestore firestore;
  AdminRepository({
    required this.firestore,
  });
  MedicalModel? helpMessages;
  Future<MedicalModel?> getHelpMessages() async {
    final helpMessagesData = await firestore.collection('medicals').doc().get();

    if (helpMessagesData.data() != null) {
      for (var doc in helpMessagesData.data()!.values) {
        helpMessages = MedicalModel.fromMap(doc);
      }
      return helpMessages;
    }
    return helpMessages;
  }

  // Stream<UserModel?> helpMessDet() {
  //   return firestore.collection('medicals').snapshots().map((event) {
  //     for(var doc in event.docs)
  //   } )

  // }

  Stream<MedicalModel> get helpMess {
    late MedicalModel helpData;
    return firestore.collection('medicals').snapshots().map((event) {
      for (var document in event.docs) {
        return helpData = MedicalModel.fromMap(document.data());
      }

      return helpData;
    });
  }

  Stream<List<MedicalModel>> helpMessageData() {
    //  DocumentReference? doc;
    // final db = firestore
    //     .collection('medicals')
    //     .doc('YycJf0i6UzaWfbOvm0OOilk9lY23')
    //     .collection('medical messages')
    //     .doc()
    //     .id;

    return firestore
        .collection('medicals')
        // .doc()
        // .collection('medical messages')
        // .where('name.contacts')
        .snapshots()
        .map((event) {
      List<MedicalModel> medicalmod = [];
      for (var doc in event.docs) {
        medicalmod.add(
          MedicalModel.fromMap(doc.data()),
        );
      }
      return medicalmod;
    });

    // return firestore
    //     .collection('medicals')
    //     .doc('YycJf0i6UzaWfbOvm0OOilk9lY23')
    //     .collection('medical messages')
    //     .doc()
    //     .snapshots()
    //     .map((event) => MedicalModel.fromMap(event.data()!));

    // firestore
    //     .collection('medicals')
    //     .doc("LDRyNPPtCCMVAIUO63X7")
    //     .snapshots()
    //     .map((event) => MedicalModel.fromMap(event.data()!));
  }
}
