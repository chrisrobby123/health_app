import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/features/admin/repository/admin_repository.dart';
import 'package:health_app/models/medical_model.dart';

final medicalModStreamProvider = StreamProvider((ref) {
  final adminController = ref.watch(adminControllerProvider);
  return adminController.helpMessageData();
});

final adminControllerProvider = Provider((ref) {
  final adminRepository = ref.watch(adminRepositoryProvider);
  return AdminController(adminRepository: adminRepository);
});

class AdminController {
  final AdminRepository adminRepository;
  AdminController({required this.adminRepository});

  Future<MedicalModel?> getMessages() {
    return adminRepository.getHelpMessages();
  }

  Stream<List<MedicalModel>> helpMessageData() {
    return adminRepository.helpMessageData();
  }
}
