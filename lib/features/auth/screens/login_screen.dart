// import 'package:flutter/material.dart';
// import 'package:health_app/core/commons/custom_textformfield.dart';

// class LogInScreen extends StatefulWidget {
//   const LogInScreen({super.key});

//   @override
//   State<LogInScreen> createState() => _LogInScreenState();
// }

// class _LogInScreenState extends State<LogInScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//         body: Expanded(
//       child: Column(
//         children: [
//           Center(
//             child: Form(
//               child: Expanded(
//                 child: Column(
//                   children: [
//                     CustomTextFormField(
//                       controller: _emailController,
//                       hintText: 'Email',
//                     ),
//                     CustomTextFormField(
//                       controller: _passwordController,
//                       hintText: 'Password',
//                     ),
//                     Expanded(
//                       child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.red,
//                               minimumSize: Size(200, 50),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(15),
//                               ),
//                               elevation: 0),
//                           onPressed: () {},
//                           child: const Text('Sign In')),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ));
//   }
// }
