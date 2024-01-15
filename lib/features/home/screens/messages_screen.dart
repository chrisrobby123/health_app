import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/features/chat/controller/chat_controller.dart';
import 'package:health_app/features/home/widgets/doctors_list.dart';

class MessagesScreen extends ConsumerWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Messages',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Have a conversation with a specialist now and get the help needed',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const DoctorsList(),
            const Text(
              'Chats',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            ref.watch(chatDisplayStreamProvider).when(
                  data: (data) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder: (ctx, i) {
                          return Padding(
                            padding: const EdgeInsets.all(3),
                            child: ListTile(
                                leading: const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8bm8lMjBwcm9maWxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60'),
                                ),
                                title: Text(
                                  data[i].name,
                                ),
                                subtitle: Text(
                                  data[i].lastMessage,
                                ),
                                trailing: const Text(
                                    '13:52') //Text(DateFormat.Hm().format(data[i].timeSent.toString())),
                                ),
                          );
                        });
                  },
                  error: (err, sttr) {
                    return Center(
                      child: Text(err.toString()),
                    );
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                )

            // Expanded(
            //   flex: 5,
            //   child: Text('Chats',
            //       style: TextStyle(
            //         fontSize: 20,
            //         fontWeight: FontWeight.bold,
            //       )),
            // ),
          ],
        ),
      ),
    );
  }
}
