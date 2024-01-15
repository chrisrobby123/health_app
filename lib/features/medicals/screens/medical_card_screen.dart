import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_app/core/commons/custom_elevated_button.dart';
import 'package:health_app/core/commons/custom_textformfield.dart';
import 'package:health_app/features/medicals/controller/medical_controller.dart';

class MedicalCard extends ConsumerStatefulWidget {
  static const routeName = '/medical-card';
  final String uid;
  MedicalCard({super.key, required this.uid});

  @override
  ConsumerState<MedicalCard> createState() => _MedicalCardState();
}

class _MedicalCardState extends ConsumerState<MedicalCard> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _symptomsController = TextEditingController();
  // final TextEditingController _nameController = TextEditingController();

  void sendMedicalMessage(
    BuildContext context,
    receiverUserId,
  ) {
    ref.read(medicalControllerProvider).sendMedicalMessage(
          context,
          _nameController.text,
          _contactController.text,
          _symptomsController.text,
          receiverUserId,
        );
    _nameController.text = '';
    _contactController.text = '';
    _symptomsController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    //  final receiverUserId = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.uid),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  'Fill out Medical Card to get assited:',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.aclonica(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  hintText: 'Name',
                  controller: _nameController,
                  prefixIcon: const Icon(Icons.person),
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  hintText: 'Contact',
                  keyboardType: TextInputType.number,
                  controller: _contactController,
                  prefixIcon: const Icon(Icons.contact_page),
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  hintText: 'Help Details',
                  maxLines: 5,
                  controller: _symptomsController,
                  prefixIcon: const Icon(Icons.help),
                ),
                const SizedBox(height: 10),
                // CustomTextFormField(
                //   hintText: 'Name',
                //   controller: _nameController,
                //   prefixIcon: const Icon(Icons.person),
                // ),
                CustomElevatedButton(
                    onPressed: () => sendMedicalMessage(context, widget.uid),
                    text: 'Send')
              ],
            ),
          ),
        ));
  }
}
