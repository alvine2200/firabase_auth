import 'package:flutter/material.dart';

import '../Service/apiservice.dart';
import '../reusable/reusable.dart';
import '../utils/util.dart';
import 'dashboard.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  String emailErrorText = '';
  String passwordErrorText = '';

  void _login(context) async {
    String email = _emailTextController.text;
    String password = _passwordTextController.text;

    // Call the API service
    var apiService = ApiService();
    var response = await apiService.login(email, password);

    // Handle the API response
    if (response['status'] == true) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const Dashboard(),
        ),
      );
    } else {
      setState(() {
        emailErrorText = response != null
            ? response['errors']['email']
            : 'Email Is Required';
        passwordErrorText = response != null
            ? response['errors']['password']
            : 'Enter Password';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("CB2B93"),
              hexStringToColor("9546C4"),
              hexStringToColor("5E61F4")
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                circularLogoWidget("assets/images/BigPen.jpeg"),
                const SizedBox(
                  height: 30.0,
                ),
                reusableTextField('Enter Email', Icons.person_outline, false,
                    _emailTextController, emailErrorText),
                const SizedBox(
                  height: 30.0,
                ),
                reusableTextField('Enter Password', Icons.lock_outline, true,
                    _passwordTextController, passwordErrorText),
                const SizedBox(
                  height: 30.0,
                ),
                signInButton(context, true, () {
                  _login(context);
                }),
                const SizedBox(
                  height: 30.0,
                ),
                linkAuthPages(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
