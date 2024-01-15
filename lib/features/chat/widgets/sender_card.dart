import 'package:flutter/material.dart';

class SenderCard extends StatelessWidget {
  final String message;
  const SenderCard({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        padding: const EdgeInsets.all(10),
        constraints: const BoxConstraints(
          maxHeight: 800,
          maxWidth: 200,
        ),
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(10)),
            border: Border.all(width: 1, color: Colors.black)),
        child: Text(message),
      ),
    );
  }
}
