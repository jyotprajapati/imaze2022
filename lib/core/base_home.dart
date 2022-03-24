import 'package:flutter/material.dart';
import 'package:imaze2k22/features/auth/ui/profile_screen.dart';
import 'package:imaze2k22/features/events/registered_events/ui/registered_events_page.dart';
import 'package:imaze2k22/features/homepage/ui/home_page.dart';
import 'package:imaze2k22/features/ticket/ticket_page.dart';

class BaseHome extends StatefulWidget {
  const BaseHome({Key? key}) : super(key: key);

  @override
  State<BaseHome> createState() => _BaseHomeState();
}

class _BaseHomeState extends State<BaseHome> {
  int currentIndex = 0;
  List<Widget> screens = [
    HomePage(),
    TicketPage(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: screens[currentIndex]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff2F063A),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _bottomNavigationBar(Icons.home, 'Home', 0),
                    _bottomNavigationBar(Icons.qr_code_2, 'Ticket', 1),
                    _bottomNavigationBar(Icons.event, 'Events', 2),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavigationBar(IconData icon, String titile, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Padding(
        padding: index == 0
            ? EdgeInsets.fromLTRB(25, 8, 8, 8)
            : index == screens.length - 1
                ? EdgeInsets.fromLTRB(8, 8, 25, 8)
                : EdgeInsets.all(8),
        child: Column(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 32,
            ),
            // Text(titile, style: TextStyle(color: Colors.white, fontSize: 10)),
          ],
        ),
      ),
    );
  }
}
