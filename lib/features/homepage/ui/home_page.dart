import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:imaze2k22/core/Widgets/widget.dart';
import 'package:imaze2k22/features/auth/ui/login_screen.dart';
import 'package:imaze2k22/features/events/registered_events/ui/registered_events_page.dart';
import 'package:imaze2k22/features/homepage/ui/about_us_page.dart';
import 'package:imaze2k22/features/homepage/ui/event_page.dart';
import 'package:imaze2k22/features/homepage/ui/team_page.dart';
import 'package:imaze2k22/features/sheets/sheets_interceptor.dart';
import 'package:imaze2k22/features/ticket/ticket_page.dart';

import 'developers_page.dart';

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
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () async {
        //     await sheetsInterceptor.initWorksheet("registration");
        //     if (sheetsInterceptor.sheets == null) {
        //       print('sheets is null');
        //       return;
        //     }
        //     await sheetsInterceptor.addValue(
        //         enrollment: 'rhr',
        //         name: 'keval',
        //         email: 'keval.prajapatimus@gmail.com',
        //         time: DateTime.now().toIso8601String());
        //     print('added');
        //   },
        //   child: Icon(Icons.add),
        // ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        drawer: Drawer(
          backgroundColor: Color(0xFF0F071F),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                  image: NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/imaze-6d6dc.appspot.com/o/Images%2FLogo%2FImaze_white%20text.png?alt=media&token=ad69e1e2-5735-4ad9-8471-3191c8a42aac")),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutUs()),
                    );
                  },
                  child: Text(
                    "About Us",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TeamPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Team",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DevelopersPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Developers",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
          child: ListView(
            children: [
              ImazeLogo(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventPage(type: "Technical"),
                        ));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/imaze-6d6dc.appspot.com/o/Images%2FHome%20Screen%20Cards%2Ftech%20events1.jpg?alt=media&token=cf43dd88-3871-4a5b-bf71-ce2a14afac6d",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventPage(type: "Technical"),
                        ));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/imaze-6d6dc.appspot.com/o/Images%2FHome%20Screen%20Cards%2Fnon%20tech%20events.jpg?alt=media&token=50925e19-db3b-4f88-a69c-4cd981469842",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EventPage(type: "Non-Technical"),
                        ));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/imaze-6d6dc.appspot.com/o/Images%2FHome%20Screen%20Cards%2FPre%20Imaze%20Worksjops.jpg?alt=media&token=bb0b3b07-be2c-4c93-bca8-594274f65fb7",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventPage(type: "Technical"),
                        ));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/imaze-6d6dc.appspot.com/o/Images%2FHome%20Screen%20Cards%2FRangManch.jpg?alt=media&token=2e1212fc-296b-4545-bb8f-8bef28f87e61",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventPage(type: "Technical"),
                        ));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/imaze-6d6dc.appspot.com/o/Images%2FHome%20Screen%20Cards%2FTech%20Eureka.jpg?alt=media&token=5ad8d85c-5cb9-4e74-bb19-0ec06446c377",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventPage(type: "Technical"),
                        ));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/imaze-6d6dc.appspot.com/o/Images%2FHome%20Screen%20Cards%2FHalf%20Day%20Hackathon.jpg?alt=media&token=8386ad07-a0aa-4fe7-8028-6ca9b9c0e922",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventPage(type: "Technical"),
                        ));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/imaze-6d6dc.appspot.com/o/Images%2FHome%20Screen%20Cards%2FDo%20it%20Yourself.jpg?alt=media&token=ce97d6b3-fbf6-4b5c-ad83-a705632e2244",
                    ),
                  ),
                ),
              )
            ],
          ),
        )
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [4
        //     Text('Home Page'),
        //     ElevatedButton(
        //       onPressed: () {
        //         Navigator.push(context, MaterialPageRoute(builder: (context) {
        //           return RegisteredEventsPage();
        //         }));
        //       },
        //       child: Text("registered events"),
        //     ),
        //     ElevatedButton(
        //       onPressed: () {
        //         Navigator.push(context, MaterialPageRoute(builder: (context) {
        //           return TicketPage();
        //         }));
        //       },
        //       child: Text("Ticket Page"),
        //     ),
        //     ElevatedButton(
        //       onPressed: () {
        //         FirebaseAuth.instance.signOut().then((value) {
        //           Navigator.push(context, MaterialPageRoute(builder: (context) {
        //             return LoginScreen();
        //           }));
        //         });
        //       },
        //       child: Text("Log Out "),
        //     ),
        //   ],
        // ),
        );
  }
}
