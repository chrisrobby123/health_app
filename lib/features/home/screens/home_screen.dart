import 'package:flutter/material.dart';

import 'package:health_app/core/commons/category_card.dart';
import 'package:health_app/core/commons/doctor_card.dart';
import 'package:health_app/features/admin/screens/view_help_messages.dart';
import 'package:health_app/features/chat/screens/chat_screen.dart';
import 'package:health_app/features/home/screens/dummy_screen.dart';
import 'package:health_app/features/home/screens/home.dart';
import 'package:health_app/features/home/screens/messages_screen.dart';
import 'package:health_app/features/home/screens/schedule_screen.dart';
import 'package:health_app/features/home/screens/settings.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int page = 0;

  void tappedPage(int index) {
    setState(() {
      page = index;
    });
  }

  List<Widget> screens = const [
    Homescreen(),
    MessagesScreen(),
    //ScheduleScreen(),
    DummyScreen(),
    SettingsScreen(),
    //ChatScreen()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          selectedLabelStyle: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
          //unselectedLabelStyle: TextStyle(color: Colors.white),
          showUnselectedLabels: false,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          backgroundColor: Colors.white,
          onTap: tappedPage,
          currentIndex: page,
          //fixedColor: Colors.black12, // Colors.deepPurple[200],
          items: const [
            BottomNavigationBarItem(
              // backgroundColor: Colors.black54,
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              //  backgroundColor: Colors.black12,
              icon: Icon(
                Icons.message,
              ),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
                // backgroundColor: Colors.black12,
                icon: Icon(Icons.schedule),
                label: 'Schedule'),
            BottomNavigationBarItem(
                //   backgroundColor: Colors.black12,
                icon: Icon(Icons.settings),
                label: 'Settings'),
          ]),
      body: screens.elementAt(page),
    );
  }
}
