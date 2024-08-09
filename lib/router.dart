import 'package:flutter/material.dart';
import 'package:health_app/features/admin/screens/view_help_messages.dart';
import 'package:health_app/features/admin/screens/view_help_messages_details.dart';
import 'package:health_app/features/auth/screens/login.dart';
import 'package:health_app/features/auth/screens/register.dart';
import 'package:health_app/features/auth/screens/register_screen.dart';
import 'package:health_app/features/chat/screens/chat_screen.dart';
import 'package:health_app/features/home/screens/about_us_screen.dart';
import 'package:health_app/features/home/screens/all_specialists_screen.dart';
import 'package:health_app/features/home/screens/general_screen.dart';
import 'package:health_app/features/home/screens/home.dart';
import 'package:health_app/features/home/screens/notifications_screen.dart';
import 'package:health_app/features/home/screens/privacy_policy_screen.dart';
import 'package:health_app/features/home/screens/settings.dart';
import 'package:health_app/features/medicals/screens/medical_card_screen.dart';
import 'package:health_app/features/splash_screen/splash_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LogInScreenn.routeName:
      return MaterialPageRoute(
        builder: (context) => const LogInScreenn(),
      );
    case Register.routeName:
      return MaterialPageRoute(
        builder: (context) => const Register(),
      );
    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    case Homescreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const Homescreen(),
      );
    case ChatScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const ChatScreen(),
      );
    // case MedicalCard.routeName:
    //   return MaterialPageRoute(
    //     builder: (context) => const MedicalCard(),
    //   );
    case ViewHelpMessages.routeName:
      return MaterialPageRoute(
        builder: (context) => const ViewHelpMessages(),
      );
    case ViewHelpMessagesDetails.routeName:
      var helpDetails = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) => ViewHelpMessagesDetails(
          helpDetails: helpDetails,
        ),
      );
    case AllSpecialistsScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const AllSpecialistsScreen(),
      );
    case PrivacyPolicyScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const PrivacyPolicyScreen(),
      );
    case NotificationsScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const NotificationsScreen(),
      );
    case AboutUsScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const AboutUsScreen(),
      );
    case GeneralScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const GeneralScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(
            child: Text('Page does not build exist.'),
          ),
        ),
      );
  }
}
