import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:imaze2k22/features/auth/auth_controller.dart';
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
  SheetsInterceptor sheetsInterceptor = SheetsInterceptor();
  @override
  void initState() {
    sheetsInterceptor.init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'name'),
            controller: _nameController,
          ),
          TextFormField(
            controller: _enrlController,
            decoration: InputDecoration(labelText: 'Enrollment No.'),
          ),
          ElevatedButton(
            child: Text('Register'),
            onPressed: _onRegisterPressed,
          ),
        ],
      ),
    );
  }

  _onRegisterPressed() async {
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
            Text("Loading...")
          ],
        ),
      ),
    );

    await AuthController()
        .saveUser(
            _nameController.text, widget.googleUser.email, _enrlController.text)
        .then((value) async {
      await AuthController().googleSignin(widget.googleUser);
    });
    sheetsInterceptor.addValue(_enrlController.text, _nameController.text,
        widget.googleUser.email, DateTime.now().toIso8601String());

    Navigator.of(context).pop();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }
}
