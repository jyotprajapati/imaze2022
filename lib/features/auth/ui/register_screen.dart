import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:imaze2k22/core/base_home.dart';
import 'package:imaze2k22/features/auth/auth_controller.dart';
import 'package:imaze2k22/features/events/event_model.dart';
import 'package:imaze2k22/features/events/registered_events/events_controller.dart';
import 'package:imaze2k22/features/homepage/ui/home_page.dart';
import 'package:imaze2k22/features/sheets/sheets_interceptor.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key, required this.googleUser}) : super(key: key);
  final GoogleSignInAccount googleUser;
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = new TextEditingController();
  final _enrlController = new TextEditingController();
  final _collegeController = new TextEditingController();
  final _deptController = new TextEditingController();
  final _yearController = new TextEditingController();
  final _phoneController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  SheetsInterceptor sheetsInterceptor = SheetsInterceptor();

  List<UserEvent> events = [];

  getRegisteredEvents() async {
    await sheetsInterceptor.initWorksheet("registration");
    events = await EventsController()
        .getCurrentUserRegisteredEvents(widget.googleUser.email);

    // events = await EventsController().getRegisteredEventsDetails(_userEvents);
    print(events);
    setState(() {});
  }

  @override
  void initState() {
    getRegisteredEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: events.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Form(
                autovalidateMode: AutovalidateMode.always,
                key: _formKey,
                child: ListView(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Image.network(
                        "https://firebasestorage.googleapis.com/v0/b/imaze-6d6dc.appspot.com/o/Images%2FLogo%2FImaze_white_text.png?alt=media&token=a5d0f0b5-7115-489f-b53f-81b2757301a9"),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Full Name';
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Color(0xFF45064C),
                                width: 2.0,
                              ),
                            ),
                            fillColor: Color(0xFF45064C),
                            filled: true,
                            hoverColor: Color(0xFF45064C),
                            focusColor: Color(0xFF45064C),
                            labelText: '   Full Name',
                            labelStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Enrollment Number';
                          }
                          return null;
                        },
                        controller: _enrlController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Color(0xFF45064C),
                                width: 2.0,
                              ),
                            ),
                            fillColor: Color(0xFF45064C),
                            filled: true,
                            labelText: '   Enrollment Number',
                            labelStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter College Name';
                          }
                          return null;
                        },
                        controller: _collegeController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Color(0xFF45064C),
                                width: 2.0,
                              ),
                            ),
                            fillColor: Color(0xFF45064C),
                            filled: true,
                            labelText: '   College',
                            labelStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Department';
                          }
                          return null;
                        },
                        controller: _deptController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Color(0xFF45064C),
                                width: 2.0,
                              ),
                            ),
                            fillColor: Color(0xFF45064C),
                            filled: true,
                            labelText: '   Department',
                            labelStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Year of Study';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        controller: _yearController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Color(0xFF45064C),
                                width: 2.0,
                              ),
                            ),
                            fillColor: Color(0xFF45064C),
                            filled: true,
                            labelText: '   Year of Study',
                            labelStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length != 10) {
                            return 'Please enter valid Phone Number';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        controller: _phoneController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Color(0xFF45064C),
                                width: 2.0,
                              ),
                            ),
                            fillColor: Color(0xFF45064C),
                            filled: true,
                            labelText: '   Phone Number (WhatsApp)',
                            labelStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(21.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white)),
                        child: Text(
                          'Register',
                          style:
                              TextStyle(fontSize: 25, color: Color(0xFF45064C)),
                        ),
                        onPressed: _onRegisterPressed,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  _onRegisterPressed() async {
    if (_formKey.currentState!.validate()) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          title: Row(
            children: [
              SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(),
              ),
              Text("   Loading...")
            ],
          ),
        ),
      );
      await sheetsInterceptor
          .addValue(
        enrollment: _enrlController.text,
        name: _nameController.text,
        College: _collegeController.text,
        Department: _deptController.text,
        Phone: _phoneController.text,
        Year: _yearController.text,
        email: widget.googleUser.email,
        time: DateTime.now().toIso8601String(),
        events: events.map((e) => e.name).toList().toString(),
        leaders: events.map((e) => e.leaderName).toList().toString(),
        leaderEmails: events.map((e) => e.leaderEmail).toList().toString(),
      )
          .catchError((e) {
        print(e);
      });
      await addToSheets();
      await AuthController()
          .saveUser(
              enrollment: _enrlController.text,
              name: _nameController.text,
              College: _collegeController.text,
              Department: _deptController.text,
              Phone: _phoneController.text,
              Year: _yearController.text,
              email: widget.googleUser.email,
              time: DateTime.now().toIso8601String())
          .then((value) async {
        await AuthController().googleSignin(widget.googleUser);
      });

      Navigator.of(context).pop();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => BaseHome(),
        ),
      );
    }
  }

  addToSheets() async {
    for (UserEvent event in events) {
      await sheetsInterceptor.initWorksheet(event.name);
      sheetsInterceptor.addIndividual(
        enrollment: _enrlController.text,
        name: _nameController.text,
        College: _collegeController.text,
        Department: _deptController.text,
        Phone: _phoneController.text,
        Year: _yearController.text,
        email: widget.googleUser.email,
        time: DateTime.now().toIso8601String(),
        leaderEmail: event.leaderEmail,
        leaderName: event.leaderName,
      );
    }
  }
}
