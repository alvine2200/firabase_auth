import 'package:firebase_auth/laravel/screens/dashboard.dart';
import 'package:firebase_auth/laravel/utils/util.dart';
import 'package:flutter/material.dart';

import '../reusable/reusable.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _phoneTextController = TextEditingController();
  final TextEditingController _countyTextController = TextEditingController();
  final TextEditingController _subcountyTextController =
      TextEditingController();
  final TextEditingController _residenceTextController =
      TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _passwordConfirmationTextController =
      TextEditingController();

  String nameErrorText = "";
  String countyErrorText = "";
  String subcountyErrorText = "";
  String residenceErrorText = "";
  String phoneErrorText = "";
  String emailErrorText = "";
  String passwordErrorText = "";
  String passwordConfirmationErrorText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 100.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Create An Account',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
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
                reusableTextField('Enter Name', Icons.person_outline, false,
                    _nameTextController, nameErrorText),
                const SizedBox(
                  height: 30.0,
                ),
                reusableTextField('Enter Phone', Icons.phone, false,
                    _phoneTextController, phoneErrorText),
                const SizedBox(
                  height: 30.0,
                ),
                reusableTextField('Enter Email', Icons.email, false,
                    _emailTextController, emailErrorText),
                const SizedBox(
                  height: 30.0,
                ),
                reusableTextField('Enter County ', Icons.map, false,
                    _countyTextController, countyErrorText),
                const SizedBox(
                  height: 30.0,
                ),
                reusableTextField('Enter Sub-County', Icons.map, false,
                    _subcountyTextController, subcountyErrorText),
                const SizedBox(
                  height: 30.0,
                ),
                reusableTextField(
                    'Enter Area Of Residence',
                    Icons.area_chart_sharp,
                    false,
                    _residenceTextController,
                    residenceErrorText),
                const SizedBox(
                  height: 30.0,
                ),
                reusableTextField('Enter Password', Icons.lock_outline, true,
                    _passwordTextController, passwordErrorText),
                const SizedBox(
                  height: 30.0,
                ),
                reusableTextField(
                    'Enter Password Again',
                    Icons.lock_outline,
                    true,
                    _passwordConfirmationTextController,
                    passwordConfirmationErrorText),
                const SizedBox(
                  height: 30.0,
                ),
                signInButton(
                  context,
                  false,
                  () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => const Dashboard(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
