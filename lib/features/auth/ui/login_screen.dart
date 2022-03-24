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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                "https://firebasestorage.googleapis.com/v0/b/imaze-6d6dc.appspot.com/o/Images%2FLogo%2FImaze_white%20text.png?alt=media&token=ad69e1e2-5735-4ad9-8471-3191c8a42aac"),
            // TextButton(
            //     onPressed: () {
            //       FirebaseAuth.instance.signOut();
            //     },
            //     child: Text("log out")),
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SocialLoginButton(
                  // backgroundColor: Colors.amber,
                  height: 45,
                  text: 'Sign in with Google',
                  borderRadius: 20,
                  fontSize: 20,
                  textColor: Colors.grey,
                  buttonType: SocialLoginButtonType.google,
                  imageWidth: 20,
                  onPressed: _onLoginPressed),
            ),
            SizedBox(
              height: 24,
            ),
          ],
        ),
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
                //45064C
                // backgroundColor: Color(0xFFF45064C),
                title: Text('You have not registered yet'),
                content: Text('Please register first'),
                actions: [
                  FlatButton(
                    child: Text('Ok'),
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
