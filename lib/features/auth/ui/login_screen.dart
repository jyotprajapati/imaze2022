import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:imaze2k22/features/auth/ui/register_screen.dart';
import 'package:imaze2k22/features/events/registered_events/ui/registered_events_page.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

import '../../homepage/ui/home_page.dart';
import '../auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: Text("log out")),
          SocialLoginButton(
              // backgroundColor: Colors.amber,
              height: 50,
              text: 'SignIn',
              borderRadius: 20,
              fontSize: 25,
              buttonType: SocialLoginButtonType.google,
              imageWidth: 20,
              onPressed: _onLoginPressed),
          SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }

  _onLoginPressed() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      print("no user seleted");
      return;
    }
    bool? userExist = await AuthController().checkUserExists(googleUser);
    if (userExist == null) {
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Muft ka nahi hai'),
                content: Text('Paise dena padta hai pehla'),
                actions: [
                  FlatButton(
                    child: Text('theek hai bhai'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ));
    } else {
      if (userExist == true) {
        await AuthController().googleSignin(googleUser);

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => RegisteredEventsPage(),
            ));
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RegisterScreen(
                googleUser: googleUser,
              ),
            ));
      }
    }
  }
}
