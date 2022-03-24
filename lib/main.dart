import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:imaze2k22/core/base_home.dart';
import 'package:imaze2k22/features/auth/ui/login_screen.dart';
import 'package:imaze2k22/features/homepage/ui/home_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          primaryColor: Color(0xFF0F071F),
          scaffoldBackgroundColor: Color(0xFF0F071F)),
      home: FirebaseAuth.instance.currentUser == null
          ? LoginScreen()
          : BaseHome(),
    );
  }
}
