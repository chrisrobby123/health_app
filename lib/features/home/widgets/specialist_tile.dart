import 'package:flutter/material.dart';

class SpecialistTile extends StatelessWidget {
  final VoidCallback onTap;
  final String name;
  final String specialty;
  final String profileImg;

  const SpecialistTile({
    super.key,
    required this.name,
    required this.onTap,
    required this.specialty,
    required this.profileImg,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(profileImg),
      ),
      title: Text(name),
      subtitle: Text(specialty),
    );
  }
}
