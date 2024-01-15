import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_app/features/auth/controller/auth_controller.dart';
import 'package:health_app/features/home/screens/about_us_screen.dart';
import 'package:health_app/features/home/screens/general_screen.dart';
import 'package:health_app/features/home/screens/notifications_screen.dart';
import 'package:health_app/features/home/screens/privacy_policy_screen.dart';
import 'package:health_app/features/home/screens/profile_screen.dart';
import 'package:health_app/features/home/widgets/listtile.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  navigateToProfileScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfileScreen(),
      ),
    );
  }

  navigateToPrivacyPolicyScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PrivacyPolicyScreen(),
      ),
    );
  }

  navigateToNotificationsScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NotificationsScreen(),
      ),
    );
  }

  navigateToAboutUsScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AboutUsScreen(),
      ),
    );
  }

  navigateToGeneralScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const GeneralScreen(),
      ),
    );
  }

  logOut(WidgetRef ref, BuildContext context) {
    ref.read(authControllerProvider).signOut(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 40,
          ),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/nurse1.jpg'),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 20),
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Profile Name',
                        style: GoogleFonts.aclonica(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        '0599460499',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.aclonica(
                            fontWeight: FontWeight.w300, fontSize: 15),
                      )
                    ],
                  ),
                ],
              ),
              const Divider(
                color: Colors.black,
                height: 35,
                thickness: 0.2,
              ),
              ListTilee(
                icon: Icons.person,
                text: 'Profile',
                onTap: () => navigateToProfileScreen(context),
              ),
              ListTilee(
                icon: Icons.notification_add,
                text: 'Notifications',
                onTap: () => navigateToNotificationsScreen(context),
              ),
              ListTilee(
                icon: Icons.privacy_tip_outlined,
                text: 'Privacy',
                onTap: () => navigateToPrivacyPolicyScreen(context),
              ),
              ListTilee(
                icon: Icons.all_out_sharp,
                text: 'General ',
                onTap: () => navigateToGeneralScreen(context),
              ),
              ListTilee(
                icon: Icons.archive_rounded,
                text: 'About Us',
                onTap: () => navigateToAboutUsScreen(context),
              ),
              const SizedBox(height: 20),
              const Divider(
                color: Colors.black,
                height: 35,
                thickness: 0.2,
              ),
              ListTilee(
                icon: Icons.exit_to_app,
                text: 'Log Out',
                onTap: () => logOut(ref, context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
