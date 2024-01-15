import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewHelpMessagesDetails extends ConsumerWidget {
  static const String routeName = '/view-help-messages-details';
  final String helpDetails;
  const ViewHelpMessagesDetails({super.key, required this.helpDetails});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10),
      child: Text(helpDetails),
    ));
  }
}
