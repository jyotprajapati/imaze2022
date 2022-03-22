import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:imaze2k22/features/auth/ui/login_screen.dart';
import 'package:imaze2k22/features/events/registered_events/ui/registered_events_page.dart';
import 'package:imaze2k22/features/sheets/sheets_interceptor.dart';
import 'package:imaze2k22/features/ticket/ticket_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SheetsInterceptor sheetsInterceptor = SheetsInterceptor();
  @override
  void initState() {
    sheetsInterceptor.init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await sheetsInterceptor.init();
          if (sheetsInterceptor.sheets == null) {
            print('sheets is null');
            return;
          }
          await sheetsInterceptor.addValue('12002080601050', 'keval',
              'keval.prajapatimus@gmail.com', DateTime.now().toIso8601String());
          print('added');
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Home Page'),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return RegisteredEventsPage();
              }));
            },
            child: Text("registered events"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return TicketPage();
              }));
            },
            child: Text("Ticket Page"),
          ),
          ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }));
              });
            },
            child: Text("Log Out "),
          ),
        ],
      ),
    );
  }
}
