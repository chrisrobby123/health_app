import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_app/core/commons/category_card.dart';
import 'package:health_app/core/commons/doctor_card.dart';
import 'package:health_app/features/admin/screens/view_help_messages.dart';
import 'package:health_app/features/auth/controller/auth_controller.dart';
import 'package:health_app/features/home/controller/home_controller.dart';
import 'package:health_app/features/home/screens/all_specialists_screen.dart';
import 'package:health_app/features/medicals/controller/medical_controller.dart';
import 'package:health_app/features/medicals/screens/medical_card_screen.dart';

class Homescreen extends ConsumerWidget {
  static const routeName = '/home-screen';
  const Homescreen({
    super.key,
  });

  void signOut(WidgetRef ref, BuildContext context) {
    ref.read(authControllerProvider).signOut(context);
  }

  void navigatetoMedicalCardScreen(BuildContext context, receiverUserId) {
    Navigator.pushNamed(
      context,
      MedicalCard.routeName,
      arguments: receiverUserId,
    );
  }

  void navigateToAllSpecialistScreen(
    BuildContext context,
  ) {
    Navigator.pushNamed(context, AllSpecialistsScreen.routeName);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    // final username = ref.read(currentUserDetailsProvider).value;
    return SingleChildScrollView(
        child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hi, ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      // username!.username,
                      'Guest',
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () => signOut(ref, context),
                  child: Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.exit_to_app,
                      size: 20,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: size.height * 0.15,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: ref.watch(quoteFutureProvider).when(
                  data: (data) {
                    return Container(
                      padding: EdgeInsets.only(bottom: 10),
                      alignment: Alignment.center,
                      child: ImageSlideshow(
                          height: size.height * 0.2,
                          autoPlayInterval: 5000,
                          indicatorColor: Colors.blue,
                          isLoop: true,
                          indicatorBackgroundColor: Colors.yellow,
                          children: //[
                              // for(va)
                              // Column(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children:
                              data.quote
                                  .map((e) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(e),
                                      ))
                                  .toList()
                          // children: [
                          //   Text(data.quote[i]),
                          //   Text(data.author[i]),
                          // ],
                          // ),
                          //  ],
                          ),
                    );

                    // ListView.builder(
                    //  // shrinkWrap: true,
                    //   //  scrollDirection: Axis.horizontal,
                    //  // itemCount: data.author.length,
                    //   itemBuilder: (ctx, i) {
                    //     // Map map = data.quote[i];

                    //   },
                    // );
                  },
                  error: (err, trace) {
                    return const Center(
                      child: Text('Error Loading Data, Refreshing...'),
                    );
                  },
                  loading: () => const Center(
                        child: CircularProgressIndicator(),
                      )),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              //  width: 40,
              decoration: BoxDecoration(
                  color: Colors.pink[100],
                  borderRadius: BorderRadius.circular(15)),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
              child: Row(
                children: [
                  // Lottie.network(
                  //   'https://assets5.lottiefiles.com/packages/lf20_u1vbg6qk.json',
                  //   height: size.height * 0.12,
                  //   fit: BoxFit.cover,
                  //   alignment: Alignment.center,
                  // ),
                  Container(
                    height: 100,
                    width: 100,
                    child: Image.asset(
                      'assets/images/Nurse_Monochromatic.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //  crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // height: size.height * 0.09,
                        //    width: do,
                        const SizedBox(width: 25),
                        const Text(
                          'Have an urgent problem? ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 8),
                        const Text(
                          'Fill out a Medical Card and get assisted. ',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple[300],
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              minimumSize: const Size(double.infinity, 40)),
                          onPressed: () => navigatetoMedicalCardScreen(
                            context,
                            ref
                                .read(medicalControllerProvider)
                                .medicalRepository,
                          ),
                          child: const Text('Fill Card'),
                        ),
                        // InkWell(
                        //   onTap: () => navigatetoMedicalCardScreen(
                        //     context,
                        //     ref
                        //         .read(medicalControllerProvider)
                        //         .medicalRepository,
                        //   ),
                        //   child: Container(
                        //     alignment: Alignment.center,
                        //     height: size.height * 0.06,
                        //     width: double.infinity,
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(15),
                        //       color: Colors.deepPurple,
                        //     ),
                        //     child: const Text(
                        //       'Fill Card',
                        //       textAlign: TextAlign.center,
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryCard(
                    text: 'Hygiene',
                  ),
                  CategoryCard(
                    text: 'Diet',
                  ),
                  CategoryCard(
                    text: 'Health',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Specialists',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => navigateToAllSpecialistScreen(context),
                    child: Text(
                      'See All Specialists',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Container(
            // padding: const EdgeInsets.only(right: 10),
            // decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(15)),
            // height: 150,
            //  child:

            // shrinkWrap: true,

            //child:
            ref.watch(getAdminStreamProvider).when(
              data: (data) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.take(4).length,
                    itemBuilder: (ctx, i) {
                      return DoctorCard(specialty: data[i].specialty);
                    },
                  ),
                );
              },
              error: (error, trace) {
                return const Center(
                  child:
                      Text('An Unknown Error Occured, Please try again later,'),
                );
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
          //children: const [
          // DoctorCard(
          //   specialty: 'Ophthalmologist',
          // ),
          // DoctorCard(
          //   specialty: 'Nutritionist',
          // ),
          // DoctorCard(
          //   specialty: 'Urologist',
          // ),
          // DoctorCard(
          //   specialty: 'Gynaecologist',
          // ),
          // DoctorCard(
          //   specialty: 'Neonatologist',
          // ),
          // DoctorCard(
          //   specialty: 'Psychiatrist',
          // ),
          // DoctorCard(
          //   specialty: 'Psychologist',
          // ),
          // DoctorCard(
          //   specialty: 'Ophthalmologist',
          // ),
          // DoctorCard(
          //   specialty: 'Respiratory Therapist',
          // ),
          // ],
        ),
        //),
      ),
    ));
  }
}
