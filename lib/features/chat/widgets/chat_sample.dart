import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';

class ChatSample extends StatelessWidget {
  const ChatSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 80),
          child: ClipPath(
            clipper: UpperNipMessageClipper(MessageType.receive),
            child: Container(
              color: Colors.pink[200],
              padding: const EdgeInsets.all(20),
              //  decoration: BoxDecoration(),
              child: const Text(
                'Hello there, folks.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 80,
            ),
            child: ClipPath(
                clipper: LowerNipMessageClipper(MessageType.send),
                child: Container(
                    color: Colors.pink[200],
                    padding: const EdgeInsets.only(
                        left: 20, top: 10, bottom: 25, right: 20),
                    //  decoration: const BoxDecoration(),
                    child: const Text('Hi, Sir what\'s up',
                        style: TextStyle(
                          fontSize: 16,
                        )))),
          ),
        ),
      ],
    );
  }
}
