import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/core/commons/loader.dart';
import 'package:health_app/features/admin/controller/admin_controller.dart';
import 'package:health_app/features/admin/repository/admin_repository.dart';
import 'package:health_app/features/admin/screens/view_help_messages_details.dart';
import 'package:health_app/features/auth/controller/auth_controller.dart';
import 'package:health_app/features/chat/controller/chat_controller.dart';
import 'package:health_app/features/chat/screens/chat_screen.dart';
import 'package:health_app/features/medicals/screens/medical_card_screen.dart';
import 'package:health_app/models/medical_model.dart';
import 'package:health_app/providers/firebase_providers.dart';

class ViewHelpMessages extends ConsumerStatefulWidget {
  static const String routeName = '/view-help-messages';
  const ViewHelpMessages({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ViewHelpMessagesState();
}

class _ViewHelpMessagesState extends ConsumerState<ViewHelpMessages> {
  // @override
  // // void initState() {
  // //   super.initState();
  // //   ref.read(adminControllerProvider).getMessages();
  // // }

  var tapped = false;

  navigateToChatScreen(String name) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) {
              return const ChatScreen();
            },
            settings: RouteSettings(name: '/chat-screen', arguments: name)));
  }

  @override
  Widget build(BuildContext context) {
    // final auth = ref.read(authProvider);
    //  FirebaseAuth auth;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Messages'),
        // actions: [IconButton(onPressed: onPressed, icon: Icon(Icons.))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ref.watch(chatDisplayStreamProvider).when(
            data: (data) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (ctx, i) => Column(children: [
                  ExpansionTile(
                    expandedAlignment: Alignment.topLeft,
                    childrenPadding: const EdgeInsets.all(10),
                    title: InkWell(
                        onTap: () => navigateToChatScreen(
                              data[i].userId,
                            ),
                        child: Text(
                          data[i].name,
                          style: const TextStyle(color: Colors.blue),
                        )),
                    subtitle: Text(data[i].name),
                    children: [Text(data[i].lastMessage)],
                    // trailing: InkWell(
                    //     onTap: () {
                    //       setState(() {
                    //         tapped = !tapped;
                    //       });
                    //     },
                    //     child: const Icon(Icons.arrow_drop_down)),
                  ),
                  // if (tapped)
                  //   Container(
                  //     child: Text(data[i].helpDetails),
                  //   ),
                ]),
              );
            },
            error: (err, sttr) {
              return Center(
                child: Text(err.toString()),
              );
            },
            loading: () => const CircularProgressIndicator()),
        // child: StreamBuilder<List<MedicalModel>>(
        //   stream: ref.watch(adminControllerProvider).helpMessageData(),
        //   builder: (ctx, snapshots) {
        //     if (snapshots.connectionState == ConnectionState.waiting) {
        //       return const Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     } else {
        //       if (snapshots.connectionState == ConnectionState.none) {
        //         return const Center(
        //           child: Text('It is gonna be alright'),
        //         );
        //       }
        //     }
        //     if (snapshots.data == null) {
        //       return const Center(
        //         child: Text('NO DATA'),
        //       );
        //     }
        //     return GestureDetector(
        //       onTap: () {},
        //       child: ListTile(
        //         title: Text(snapshots.data!.contact),
        //         subtitle: Text(snapshots.data!.name),
        //       ),
        //     );
        //   },
        // ),
      ),
    );
  }
}
