import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_app/core/commons/custom_elevated_button.dart';
import 'package:health_app/core/commons/custom_textformfield.dart';
import 'package:health_app/features/auth/controller/auth_controller.dart';
import 'package:health_app/features/auth/screens/register.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogInScreenn extends ConsumerStatefulWidget {
  const LogInScreenn({super.key});

  static const routeName = 'log-in screen';
  @override
  ConsumerState<LogInScreenn> createState() => _LogInScreenState();
}

class _LogInScreenState extends ConsumerState<LogInScreenn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var isLoading = false;

  void navigateToRegisterScreen() {
    Navigator.pushReplacementNamed(context, Register.routeName);
  }

  void signInWithEmailAndPassword() {
    setState(() {
      isLoading = true;
    });
    ref.read(authControllerProvider).signInWithEmailAndPassword(
          context,
          _emailController.text.trim(),
          _passwordController.text.trim(),
        );
    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

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
                height: 500,
              ),
            ),
            CustomTextFormField(
                prefixIcon: const Icon(Icons.email),
                hintText: 'Email',
                controller: _emailController),
            const SizedBox(height: 10),
            CustomTextFormField(
                prefixIcon: const Icon(Icons.lock),
                hintText: 'Password',
                controller: _passwordController),
            const SizedBox(
              height: 10,
            ),
            CustomElevatedButton(
              onPressed: signInWithEmailAndPassword,
              text: isLoading ? 'Signing In, Please wait...' : 'Sign In',
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: navigateToRegisterScreen,
              child: RichText(
                  textAlign: TextAlign.center,
                  selectionColor: Colors.black,
                  text: TextSpan(
                      style: GoogleFonts.aclonica(
                          color: Colors.black, fontSize: 15),
                      text: 'Unforunate not to have an account? ',
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: GoogleFonts.aclonica(color: Colors.blue),
                        )
                      ])),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    ));
  }
}
