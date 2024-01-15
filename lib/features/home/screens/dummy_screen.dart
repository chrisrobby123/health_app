import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/features/auth/controller/auth_controller.dart';
import 'package:health_app/features/medicals/screens/medical_card_screen.dart';

class DummyScreen extends ConsumerStatefulWidget {
  const DummyScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DummyScreenState();
}

class _DummyScreenState extends ConsumerState<DummyScreen> {
  void navigateToMedicalScreen(String receiverUserId) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) => MedicalCard(uid: receiverUserId))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ref.watch(allUsersStreamProvider).when(
          data: (data) {
            return Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (ctx, i) {
                      return ListTile(
                        onTap: () => navigateToMedicalScreen(data[i].uid),
                        title: Text(data[i].username),
                      );
                    }));
          },
          error: (e, s) => Center(
                child: Text(e.toString()),
              ),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
