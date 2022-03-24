import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:imaze2k22/core/Widgets/widget.dart';
import 'package:imaze2k22/features/auth/auth_controller.dart';
import 'package:imaze2k22/features/auth/current_user.dart';
import 'package:imaze2k22/features/auth/ui/login_screen.dart';
import 'package:imaze2k22/features/events/registered_events/ui/registered_events_page.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  fetchDetails() async {
    await AuthController().getCurrentUserDetails();
    setState(() {
      isLoading = false;
    });
  }

  bool isLoading = true;
  @override
  void initState() {
    fetchDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                    FirebaseAuth.instance.currentUser!.photoURL ?? "",
                  ),
                ),
              ],
            ),
          ),
          DarkContatiner(
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "HELLO",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            isLoading ? "..." : "     ${CurrentUser().name}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            EdgeInsets.all(9),
          ),
          DarkContatiner(
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Email id: ${isLoading ? '...' : CurrentUser().email}",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            EdgeInsets.all(9),
          ),
          DarkContatiner(
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "College: ${isLoading ? '...' : CurrentUser().college}",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            EdgeInsets.all(9),
          ),
          DarkContatiner(
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Dept: ${isLoading ? '...' : CurrentUser().dept}",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            EdgeInsets.all(9),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          if (CurrentUser().isIndividualRegistered ?? false)
            RegisteredEventsPage(),
          if (CurrentUser().isCombo ?? false)
            DarkContatiner(
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Combo Balance",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Column(
                            children: [
                              Text(
                                "Technical",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                              Text(
                                "${isLoading ? '...' : CurrentUser().technical}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              )
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Column(
                            children: [
                              Text(
                                "Non-Technical",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                              Text(
                                " ${isLoading ? '...' : CurrentUser().nonTechnical}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              EdgeInsets.all(9),
            ),
          TextButton(
            onPressed: () {
              FirebaseAuth.instance
                  .signOut()
                  .then((value) => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      )));
            },
            child: Text("Logout"),
          ),
        ],
      ),
    );
  }
}
