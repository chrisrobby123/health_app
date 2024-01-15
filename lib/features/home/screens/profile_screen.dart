import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:health_app/core/commons/custom_elevated_button.dart';
import 'package:health_app/core/commons/custom_textformfield.dart';
import 'package:health_app/core/commons/utils.dart';
import 'package:health_app/features/auth/controller/auth_controller.dart';
import 'package:health_app/features/auth/repository/auth_respository.dart';
import 'package:health_app/features/home/controller/home_controller.dart';
import 'package:health_app/features/home/widgets/text_field.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _contactController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  final isFormFieldEnables = false;
  var isLoading = false;
  // final TextEditingController _= TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _contactController.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // two things i have to do, fetch data conditionally for admin and normal users
    final userData = ref.watch(authRepositoryProvider).userData;
    final role = ref.read(authRepositoryProvider).role;
    String initialContactValue = '';
    String initialNameValue = '';
    String initialEmailValue = '';

    var file;

    pickImage() async {
      File? res = await pickImageFromGallery();
      if (res != null) {
        setState(() {
          file = res;
        });
      }
    }

    updateProfile() {
      setState(() {
        isLoading = true;
      });

      ref.read(homeControllerProvider).updateProfile(_contactController.text);
      String newValue = initialContactValue;
      _contactController.text = newValue;
      setState(() {
        isLoading = false;
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Me'),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: role == 'admin'
                  ? ref.watch(currentAdminDetailsProvider).when(data: (data) {
                      initialContactValue = data.contact;
                      initialNameValue = data.username;
                      initialEmailValue = data.email;
                      _nameController.text = initialNameValue;
                      _contactController.text = initialContactValue;
                      _emailController.text = initialEmailValue;
                      return Column(children: [
                        const CircleAvatar(
                          radius: 50,
                          // backgroundImage: NetworkImage(''),
                        ),
                        const SizedBox(height: 20),
                        // IgnorePointer(
                        //   ignoring: !isFormFieldEnables,
                        //   child: CustomTextFormField(
                        //     initialValue: data.username,
                        //     hintText: '',
                        //     prefixIcon: const Icon(
                        //       Icons.person,
                        //     ),
                        //   ),
                        // ),
                        CustomTextField(
                          controller: _nameController,
                        ),
                        const SizedBox(height: 10),
                        // CustomTextFormField(
                        //   // initialValue: 'Tariq',
                        //   hintText: '',
                        //   initialValue: data.email,
                        //   prefixIcon: const Icon(
                        //     Icons.email,
                        //   ),
                        // ),
                        IgnorePointer(
                          ignoring: !isFormFieldEnables,
                          child: CustomTextField(
                            controller: _emailController,
                          ),
                        ),
                        const SizedBox(height: 10),
                        // CustomTextFormField(
                        //   // initialValue: 'Lela',
                        //   hintText: '',
                        //   initialValue: data.contact,
                        //   prefixIcon: const Icon(
                        //     Icons.contact_emergency,
                        //   ),
                        // ),
                        CustomTextField(
                          controller: _contactController,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.35),
                        CustomElevatedButton(
                          onPressed: updateProfile,
                          text: 'Update',
                        )
                      ]);
                    }, error: (error, trace) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }, loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    })
                  : ref.watch(currentUserDetailsProvider).when(data: (data) {
                      String initialContactValue = data.contact;
                      String initialNameValue = data.username;
                      String initialEmailValue = data.email;
                      _nameController.text = initialNameValue;
                      _contactController.text = initialContactValue;
                      _emailController.text = initialEmailValue;
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Center(
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: const CircleAvatar(
                                      radius: 50,
                                      backgroundImage: NetworkImage(''),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 180,
                                  top: 60,
                                  bottom: 0,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: IconButton(
                                        onPressed: pickImage,
                                        icon: const Icon(
                                            Icons.camera_alt_rounded)),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            const Text('Username'),
                            CustomTextField(
                              controller: _nameController,
                            ),
                            // IgnorePointer(
                            //   ignoring: !isFormFieldEnables,
                            //   child: CustomTextFormField(
                            //     initialValue: data.username,
                            //     hintText: '',
                            //     prefixIcon: const Icon(
                            //       Icons.person,
                            //     ),
                            //   ),
                            // ),
                            const SizedBox(height: 10),
                            const Text('Email'),
                            IgnorePointer(
                              ignoring: !isFormFieldEnables,
                              child: CustomTextField(
                                controller: _emailController,
                              ),
                            ),
                            // CustomTextFormField(
                            //   // initialValue: 'Tariq',
                            //   hintText: '',
                            //   initialValue: data.email,
                            //   prefixIcon: const Icon(
                            //     Icons.email,
                            //   ),
                            // ),
                            const SizedBox(height: 10),
                            const Text('Contact'),
                            CustomTextField(
                              controller: _contactController,
                            ),
                            // CustomTextFormField(
                            //   // initialValue: 'Lela',
                            //   hintText: '',
                            //   initialValue: data.contact,
                            //   prefixIcon: const Icon(
                            //     Icons.contact_emergency,
                            //   ),
                            // ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.35),
                            CustomElevatedButton(
                              onPressed: updateProfile,
                              text: isLoading ? 'Updating' : 'Update',
                            )
                          ]);
                    }, error: (error, trace) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }, loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    })),
        ));
  }
}
