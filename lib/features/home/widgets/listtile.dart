// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListTilee extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final IconData icon;
  Widget? trailIcon;
  ListTilee({
    Key? key,
    required this.text,
    required this.onTap,
    required this.icon,
    this.trailIcon = const Icon(Icons.arrow_forward_ios),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon),
      title: Text(
        text,
        style: GoogleFonts.aclonica(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      trailing: trailIcon,
    );
  }
}
