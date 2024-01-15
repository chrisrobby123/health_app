import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_app/core/commons/custom_elevated_button.dart';
import 'package:health_app/core/commons/custom_textformfield.dart';
import 'package:health_app/core/commons/google_button.dart';
import 'package:health_app/core/extensions/extension.dart';
import 'package:health_app/features/auth/controller/auth_controller.dart';
import 'package:health_app/features/auth/screens/login.dart';

class Register extends ConsumerStatefulWidget {
  const Register({super.key});
  static const routeName = 'register-screen';

  @override
  ConsumerState<Register> createState() => _RegisterState();
}

class _RegisterState extends ConsumerState<Register> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();

  void navigateToRegisterScreen() {
    Navigator.pushReplacementNamed(context, LogInScreenn.routeName);
  }

  void signUpWithEmailAndPassword() {
    setState(() {
      isLoading = true; // Update the loading state
    });
    ref.read(authControllerProvider).signUpWithEmailAndPassword(
          context,
          _emailController.text,
          _passwordController.text,
          _usernameController.text,
          _contactController.text,
        );
    setState(() {
      isLoading = false; // Update the loading state
    });
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _contactController.dispose();
    _usernameController.dispose();
  }

  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/images/dentist-location.png',
                height: 400,
              ),
            ),
            CustomTextFormField(
                prefixIcon: const Icon(Icons.person),
                hintText: 'Username',
                controller: _usernameController),
            const SizedBox(height: 10),
            CustomTextFormField(
                prefixIcon: const Icon(Icons.email),
                hintText: 'Email',
                controller: _emailController),
            const SizedBox(height: 10),
            CustomTextFormField(
                hintText: 'Contact',
                prefixIcon: const Icon(Icons.contact_page),
                controller: _contactController),
            const SizedBox(height: 10),
            CustomTextFormField(
              hintText: 'Password',
              controller: _passwordController,
              prefixIcon: const Icon(Icons.lock),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: isLoading ? null : signUpWithEmailAndPassword,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  minimumSize: const Size(double.infinity, 50)),
              child: isLoading ? CircularProgressIndicator() : Text('Sign Up'),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: navigateToRegisterScreen,
              child: RichText(
                  selectionColor: Colors.black,
                  text: TextSpan(
                      style: GoogleFonts.aclonica(color: Colors.black),
                      text: 'Already have an Account? ',
                      children: [
                        TextSpan(
                          text: 'Sign In',
                          style: GoogleFonts.aclonica(color: Colors.blue),
                        )
                      ])),
            ),
            const SizedBox(height: 20),
            Text(
              'OR',
              style: GoogleFonts.aclonica(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            const GoogleButton()
          ],
        ),
      ),
    ));
  }
}
