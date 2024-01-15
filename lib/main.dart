import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_app/core/commons/loader.dart';
import 'package:health_app/features/admin/screens/view_help_messages.dart';
import 'package:health_app/features/auth/controller/auth_controller.dart';
import 'package:health_app/features/auth/repository/auth_respository.dart';
import 'package:health_app/features/auth/screens/login.dart';
import 'package:health_app/features/auth/screens/register.dart';
import 'package:health_app/features/auth/screens/register_screen.dart';
import 'package:health_app/features/chat/screens/chat_screen.dart';
import 'package:health_app/features/home/screens/home_screen.dart';
import 'package:health_app/features/home/screens/test_api.dart';
import 'package:health_app/features/medicals/screens/medical_card_screen.dart';
import 'package:health_app/features/splash_screen/splash_screen.dart';
import 'package:health_app/firebase_options.dart';
import 'package:health_app/router.dart';
import 'package:health_app/theme/pallete.dart';
import 'features/home/screens/privacy_policy_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(
        details); // You can customize error handling here
    FlutterError.demangleStackTrace = (StackTrace stackTrace) => stackTrace;
  };
  runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) {
        return const ProviderScope(child: MyApp());
      }));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(authStateChangedProvider).when(
          data: (data) => MaterialApp(
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            title: 'Health App',
            theme: ref.watch(themeNotifierProvider),
            onGenerateRoute: (settings) => generateRoute(settings),
            home: data != null ? const SplashScreen() : const LogInScreenn(),
          ),
          error: (err, trace) => Text(err.toString()),
          loading: () => const CircularProgressIndicator.adaptive(),
        );
  }
}
