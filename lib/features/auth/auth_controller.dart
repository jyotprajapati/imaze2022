import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  Future<void> saveUser(
    String name,
    String email,
    String enrollmentNo,
  ) async {
    await FirebaseFirestore.instance.collection('users').doc(email).set(
      {
        'name': name,
        'email': email,
        'isRegistered': true,
      },
    );
  }
}
