import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/features/auth/controller/auth_controller.dart';
import 'package:health_app/features/chat/controller/chat_controller.dart';
import 'package:health_app/features/chat/screens/chat_screen.dart';
import 'package:health_app/models/doctor.dart';
import 'package:badges/badges.dart' as badges;

class DoctorsList extends ConsumerWidget {
  const DoctorsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    void navigateToChatScreen() {
      Navigator.pushNamed(context, ChatScreen.routeName);
    }

    List<Doctor> doctors = [
      Doctor(
        name: 'Dr. Meredith Grey',
        specialty: 'Nutritionist',
        isOnline: false,
        experience: 0,
        profileImage: 'assets/images/nurse1.jpg',
      ),
      Doctor(
        name: 'Dr. Derek Shepherd',
        specialty: 'Urologist',
        isOnline: false,
        experience: 0,
        profileImage: 'assets/images/nurse2.jpg',
      ),
      Doctor(
        name: 'Dr. Cristina Yang',
        specialty: 'Gynaecologist',
        isOnline: false,
        profileImage: 'assets/images/nurse1.jpg',
        experience: 0,
      ),
      Doctor(
          name: 'Dr. Alex Karev',
          specialty: 'Neonatologist',
          isOnline: false,
          experience: 0,
          profileImage: 'assets/images/nurse2.jpg'),
      Doctor(
        name: 'Dr. Shawn Murphy',
        specialty: 'Psychiatrist',
        isOnline: false,
        profileImage: 'assets/images/nurse2.jpg',
        experience: 0,
      ),
      Doctor(
        name: 'Dr. Aaron Glassman',
        specialty: 'Psychologit',
        isOnline: false,
        profileImage: 'assets/images/nurse2.jpg',
        experience: 0,
      ),
      Doctor(
        name: 'Dr. Audrey Lim',
        specialty: 'Respiratory Therapist',
        isOnline: false,
        experience: 0,
        profileImage: 'assets/images/nurse1.jpg',
      ),
      Doctor(
          name: 'Dr. Marcus Andrews',
          specialty: 'Ophthalmologist',
          isOnline: false,
          experience: 0,
          profileImage: 'assets/images/nurse2.jpg'),
      Doctor(
          name: 'Dr. Claire Brown',
          specialty: 'Beginner Urologist',
          isOnline: false,
          experience: 0,
          profileImage: 'assets/images/nurse1.jpg'),
    ];

    return ref.watch(getAdminStreamProvider).when(
          data: ((data) {
            return SizedBox(
              height: size.height * 0.15,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                reverse: true,
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Stack(
                      //  alignment: Alignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: navigateToChatScreen,
                              child: CircleAvatar(
                                radius: 35,
                                child: Image.asset(data[i].profilePic),
                                // backgroundImage: Image.asset(
                                //   data[i].profilePic,
                                // ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              width: size.width * 0.25,
                              child: Text(
                                data[i].username,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                        Positioned(
                          //  top: 7,
                          left: 60,
                          child: badges.Badge(
                            badgeStyle: badges.BadgeStyle(
                              shape: badges.BadgeShape.square,
                              badgeColor: Colors.green,
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 8,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),

              // Expanded(
              //   flex: 1,
              //   child: const Text(
              //     'Chats',
              //     style: TextStyle(
              //       fontSize: 20,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              // Expanded(
              //   flex: 10,
              //   child: ListView.builder(
              //     itemCount: doctors.length,
              //     itemBuilder: (ctx, i) {
              //       return ListTile(
              //         leading: CircleAvatar(
              //           backgroundImage: AssetImage(doctors[i].profileImage),
              //         ),
              //         title: Text(doctors[i].name),
              //         subtitle: const Text('How can we help you'),
              //         trailing: const Text('3: 28'),
              //       );
              //     },
              //   ),
              // )
            );
          }),
          error: (error, stackTrace) {
            return Center(
              child: Text(error.toString()),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
        );
  }
}
