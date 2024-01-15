import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorCard extends StatelessWidget {
  final String specialty;
  const DoctorCard({super.key, required this.specialty});

  @override
  Widget build(BuildContext context) {
    return Padding(
      //   padding: const EdgeInsets.only(left: 18.0),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.deepPurple[100],
            borderRadius: BorderRadius.circular(15)),
        //alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        height: 120,
        width: 150,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("assets/images/nurse.jpg.jpg"),
            ),
            const SizedBox(height: 20),
            Container(
              width: 200,
              child: Text(
                'Dr Health',
                style: GoogleFonts.aclonica(),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              specialty,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
