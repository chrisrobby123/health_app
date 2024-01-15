import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/features/auth/controller/auth_controller.dart';
import 'package:health_app/features/home/widgets/specialist_tile.dart';

class AllSpecialistsScreen extends ConsumerWidget {
  static const routeName = '/allspecialistScreen';
  const AllSpecialistsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('All Specialists'),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ref.watch(getAdminStreamProvider).when(data: (data) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (ctx, i) => Column(children: [
                  SpecialistTile(
                    profileImg: data[i].profilePic,
                    name: data[i].username,
                    onTap: () {},
                    specialty: data[i].specialty,
                  ),
                ]),
              );
            }, error: (error, trace) {
              return const Center(
                child:
                    Text('An Unknown Error Occured, Please try again later,'),
              );
            }, loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            })));
  }
}
