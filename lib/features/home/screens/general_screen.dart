import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/features/home/widgets/listtile.dart';
import 'package:health_app/theme/pallete.dart';

class GeneralScreen extends ConsumerWidget {
  static const routeName = '/general-screen';
  const GeneralScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void toogleTheme(WidgetRef ref) {
      ref.read(themeNotifierProvider.notifier).toogleTheme();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'General',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // ListTile(
            //   leading: const Icon(Icons.add_to_home_screen_rounded),
            //   title: const Text('Change Theme'),
            //   trailing: Switch(
            //     value: isDark,
            //     onChanged: (value) {
            //       setState(() {
            //         isDark = value;
            //       });
            //     },
            //   ),
            // ),
            ListTilee(
              text: 'Change Theme',
              onTap: () {},
              icon: Icons.add_to_home_screen_rounded,
              trailIcon: Switch(
                  value: ref.watch(themeNotifierProvider.notifier).mode ==
                          ThemeMode.dark
                      ? true
                      : false,
                  onChanged: (value) => toogleTheme(ref)),
            ),
            ListTilee(
              text: 'Rate App',
              onTap: () {},
              icon: Icons.star,
              trailIcon: null,
            ),
            ListTilee(
              text: 'Share App',
              onTap: () {},
              icon: Icons.share,
              trailIcon: null,
            ),
            ListTilee(
              text: 'Change Password',
              onTap: () {},
              icon: Icons.password,
              trailIcon: null,
            ),
          ],
        ),
      ),
    );
  }
}

// class GeneralScreen extends StatefulWidget {
//  
//   const GeneralScreen({super.key});

//   @override
//   State<GeneralScreen> createState() => _GeneralScreenState();
// }

// class _GeneralScreenState extends State<GeneralScreen> {
 

//  
//   @override
//   Widget build(BuildContext context) {
  
//   }
// }
