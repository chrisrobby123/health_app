import 'package:flutter/material.dart';

class ReceiverCard extends StatelessWidget {
  const ReceiverCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        padding: const EdgeInsets.all(10),
        constraints: const BoxConstraints(
          maxHeight: 100,
          maxWidth: 200,
        ),
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius:
                const BorderRadius.only(topRight: Radius.circular(10)),
            border: Border.all(width: 1, color: Colors.black)),
        child: const Text(
            'Popcorn, How can I help you, You know you are my favorite customer'),
      ),
    );
  }
}
