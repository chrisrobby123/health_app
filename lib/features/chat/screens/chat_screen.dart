import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/core/commons/custom_textformfield.dart';
import 'package:health_app/features/chat/controller/chat_controller.dart';
import 'package:health_app/features/chat/repository/chat_repository.dart';
import 'package:health_app/features/chat/widgets/chat_sample.dart';

import 'package:health_app/features/chat/widgets/receiver_card.dart';
import 'package:health_app/features/chat/widgets/sender_card.dart';

class ChatScreen extends ConsumerStatefulWidget {
  static const routeName = '/chat-screen';
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _messageController.dispose();
  }

  void sendMessage(receiverUserId) {
    ref.read(chatControllerProvider).sendMessage(
          context,
          _messageController.text,
          receiverUserId,
        );
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    var isMe = auth.currentUser != null ? true : false;
    final size = MediaQuery.of(context).size;

    final receiverUserid = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: AppBar(
          leadingWidth: 25,
          title: Row(
            children: const [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/images/nurse.jpg.jpg'),
              ),
              SizedBox(width: 5),
              Text(
                'Dr. Will Eleven',
                style: TextStyle(fontSize: 19),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 2, right: 5),
              child: IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.80,
              child: ListView.builder(
                // shrinkWrap: true,
                //reverse: true,
                itemCount: 10,
                itemBuilder: (context, i) {
                  return ref.watch(chatStreamProvider).when(
                      data: (data) {
                        return const ChatSample();
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 10, vertical: 3),
                        //   child: isMe
                        //       ? SenderCard(
                        //           message: data[i].text,
                        //         )
                        //       : const ReceiverCard(),
                        // );
                      },
                      error: (err, sttr) {
                        return Center(
                          child: Text(err.toString()),
                        );
                      },
                      loading: () => const CircularProgressIndicator());

                  // const SizedBox(height: 10),
                },
              ),
            ),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.end,
            //     children: [
            //       SizedBox(
            //         width: 300,
            //         //  height: 200,
            //         child: Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: CustomTextFormField(
            //             hintText: 'Type Something...',
            //             controller: _messageController,
            //             prefixIcon: const Icon(
            //               Icons.emoji_emotions,
            //             ),
            //           ),
            //         ),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Container(
            //           // alignment: Alignment.center,
            //           decoration: BoxDecoration(
            //               color: Colors.blue,
            //               borderRadius: BorderRadius.circular(15)),
            //           child: IconButton(
            //               onPressed: () => sendMessage(receiverUserid),
            //               icon: const Icon(
            //                 Icons.send,
            //                 size: 25,
            //               )),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: size.height * 0.09,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 2,
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 7,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  size: 28,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 7,
              ),
              child: Container(
                alignment: Alignment.centerRight,
                width: size.width / 1.5, //260,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Type Message...',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.send,
                    size: 30,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
