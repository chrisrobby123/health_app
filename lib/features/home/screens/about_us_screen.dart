import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  static const routeName = '/about-us-screen';
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Health Clinic is a medical digital platform aiming to bring health services to everyone\'s screen with a single press of the app, We have been operating on various social media platforms for around 4 years now and now available on all android platforms. We are a team consisting of highly skilled specialists ranging in almost all the various fields of the health industry. We are committed to our valued users to bring quality services found nowhere else. We offer all the services one can find in any health institution near you.',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'All services cannot be listed, here is a few;',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            RichText(
              text: const TextSpan(
                text: '.FaceTime Specialists to address your health issues\n\n',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                children: [
                  TextSpan(
                    text: '.Calling Specialists for emergencies.\n\n',
                  ),
                  TextSpan(
                    text:
                        '.Filling a Medical Card and getting addressed as soon as possible\n\n',
                  ),
                  TextSpan(
                    text:
                        '.Getting access to privileged medical information\n\n',
                  ),
                  TextSpan(
                    text:
                        'This and many more we offer, explore the app and do not forget to leave a review as we are committed to making the app better.\n\n',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
