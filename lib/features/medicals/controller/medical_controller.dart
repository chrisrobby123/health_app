// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/features/auth/controller/auth_controller.dart';
import 'package:health_app/features/medicals/repository/medical_repository.dart';
import 'package:health_app/models/user_model.dart';

final medicalControllerProvider = Provider((ref) {
  final medicalRep = ref.read(medicalRepositoryProvider);
  return MedicalController(
    medicalRepository: medicalRep,
    ref: ref,
  );
});

class MedicalController {
  final MedicalRepository medicalRepository;
  final ProviderRef ref;
  MedicalController({
    required this.medicalRepository,
    required this.ref,
  });

  // void sendMedicalMessage(String name, String contact, String helpDetails) {
  //   medicalRepository.sendMedicalMessage(name, contact, helpDetails);
  // }

  void sendMedicalMessage(BuildContext context, String name, String contact,
      String helpDetails, String receiverUserId) async {
    ref
        .read(userDataProvider)
        .whenData((value) => medicalRepository.sendMedicalMessage(
              context,
              name,
              contact,
              helpDetails,
              receiverUserId,
              value!,
            ));
  }
}
