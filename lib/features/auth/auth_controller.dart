import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:imaze2k22/features/auth/current_user.dart';
import 'package:imaze2k22/features/events/registered_events/events_controller.dart';

class AuthController {
  // if returns
  // true then user is logged in
  // flase then user is not logged in
  // null then useremail is not exists
  Future<bool?> checkUserExists(GoogleSignInAccount googleUser) async {
    // check if user already exists in firebase auth
    final snapShot = await FirebaseFirestore.instance
        .collection('users')
        .doc(googleUser.email)
        .get();

    if (snapShot.exists) {
      if (snapShot.get('isRegistered') == true) {
        return true;
      } else {
        return false;
      }
    } else {
      return null;
    }
  }

  Future<User?> googleSignin(GoogleSignInAccount googleUser) async {
    final GoogleSignInAuthentication? googleAuth =
        await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final user =
        (await FirebaseAuth.instance.signInWithCredential(credential)).user;
    return user;
  }

  Future<void> saveUser({
    String? enrollment,
    String? name,
    String? email,
    String? time,
    String? College,
    String? Department,
    String? Year,
    String? Phone,
  }) async {
    await FirebaseFirestore.instance.collection('users').doc(email).update(
      {
        'Enrollment': enrollment,
        'Name': name,
        'email': email,
        'Time': time,
        'College': College,
        'Department': Department,
        'Year': Year,
        'Phone': Phone,
        "isRegistered": true,
      },
    );
  }

  getCurrentUserDetails() async {
    await Future.wait([getEventAccountDetails(), setNameDetails()])
        .then((value) {
      print(value);
    });
    return CurrentUser();
  }

  Future<void> getEventAccountDetails() async {
    List<UserEvent> _userEvents =
        await EventsController().getCurrentUserRegisteredEvents();
    CurrentUser().registeredEvents =
        await EventsController().getRegisteredEventsDetails(_userEvents);
  }

  Future<void> setNameDetails() async {
    final user = FirebaseAuth.instance.currentUser;

    final snapShot = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.email!)
        .get()
        .then((snapshot) {
      final data = snapshot.data();
      if (data != null) {
        CurrentUser().name = data['Name'] ?? "";
        CurrentUser().email = data['email'] ?? "";
        CurrentUser().college = data['College'] ?? "";
        CurrentUser().dept = data['Department'] ?? "";
      }
    });
  }
}
