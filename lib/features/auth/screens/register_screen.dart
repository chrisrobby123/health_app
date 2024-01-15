// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:health_app/core/commons/custom_textformfield.dart';
// import 'package:health_app/features/auth/controller/auth_controller.dart';

// class LogInScreen extends ConsumerStatefulWidget {
//   const LogInScreen({super.key});

//   @override
//   ConsumerState<LogInScreen> createState() => _LogInScreenState();
// }

// class _LogInScreenState extends ConsumerState<LogInScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   void signUpWithEmailAndPassword() {
//     ref.read(authControllerProvider).signInWithEmailAndPassword(
//           context,
//           _emailController.text.trim(),
//           _passwordController.text.trim(),
//         );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//         body: Expanded(
//       child: Column(
//         children: [
//           Center(
//               child: Form(
//                   child: Column(
//             children: [
//               CustomTextFormField(
//                 controller: _emailController,
//                 hintText: 'Email',
//                 prefixIcon: const Icon(Icons.person),
//               ),
//               CustomTextFormField(
//                 controller: _passwordController,
//                 hintText: 'Password',
//                 prefixIcon: const Icon(Icons.person),
//               ),
//               ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       minimumSize: const Size(double.infinity, 50),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       elevation: 0),
//                   onPressed: signUpWithEmailAndPassword,
//                   child: const Text('Sign Up'))
//             ],
//           ))),
//         ],
//       ),
//     ));
//   }
// }
