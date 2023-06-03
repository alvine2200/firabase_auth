import 'package:firebase_auth/laravel/screens/dashboard.dart';
import 'package:firebase_auth/laravel/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Service/apiservice.dart';
import '../reusable/reusable.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  //error top right corner
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

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

//regster function
  void _registerUser(context) async {
    String name = _nameTextController.text;
    String phone = _phoneTextController.text;
    String email = _emailTextController.text;
    String county = _countyTextController.text;
    String subcounty = _subcountyTextController.text;
    String residence = _residenceTextController.text;
    String password = _passwordTextController.text;
    String passwordConfirmation = _passwordConfirmationTextController.text;

    // Clear text fields
    _nameTextController.clear();
    _phoneTextController.clear();
    _emailTextController.clear();
    _countyTextController.clear();
    _subcountyTextController.clear();
    _residenceTextController.clear();
    _passwordTextController.clear();
    _passwordConfirmationTextController.clear();

    // Reset error messages
    setState(() {
      nameErrorText = "";
      countyErrorText = "";
      subcountyErrorText = "";
      residenceErrorText = "";
      phoneErrorText = "";
      emailErrorText = "";
      passwordErrorText = "";
      passwordConfirmationErrorText = "";
    });

    // Validate input fields
    if (name.isEmpty) {
      setState(() {
        nameErrorText = 'Name is required';
      });
    }
    if (phone.isEmpty) {
      setState(() {
        phoneErrorText = 'Phone is required';
      });
    }
    if (email.isEmpty) {
      setState(() {
        emailErrorText = 'Email is required';
      });
    } else if (!_isValidEmail(email)) {
      setState(() {
        emailErrorText = 'Invalid email';
      });
    }
    if (county.isEmpty) {
      setState(() {
        countyErrorText = 'County is required';
      });
    }
    if (subcounty.isEmpty) {
      setState(() {
        subcountyErrorText = 'Subcounty is required';
      });
    }
    if (residence.isEmpty) {
      setState(() {
        residenceErrorText = 'Residence is required';
      });
    }
    if (password.isEmpty) {
      setState(() {
        passwordErrorText = 'Password is required';
      });
      return;
    }

    // Call the API service
    var apiService = ApiService();
    var response = await apiService.register(name, phone, email, county,
        subcounty, residence, password, passwordConfirmation);

    if (response['status'] == true) {
      // Show success toast message
      showSuccessToast('Registration successful!');
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const Dashboard(),
        ),
      );
    } else {
      if (response['errors'] == null &&
          response['status'] == false &&
          response['message'] != null) {
        // Display error message in SnackBar
        final snackBar = SnackBar(content: Text(response['message']));
        _scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
      }
      setState(() {
        nameErrorText = response['errors']['name'] != null
            ? response['errors']['name'][0]
            : 'Name Is Required';
        phoneErrorText = response['errors']['phone'] != null
            ? response['errors']['phone'][0]
            : 'Phone is Required';
        emailErrorText = response['errors']['email'] != null
            ? response['errors']['email'][0]
            : 'Email Is Required';
        countyErrorText = response['errors']['county'] != null
            ? response['errors']['county'][0]
            : 'County is Required';
        subcountyErrorText = response['errors']['subcounty'] != null
            ? response['errors']['subcounty'][0]
            : 'SubCounty Is Required';
        residenceErrorText = response['errors']['residence'] != null
            ? response['errors']['residence'][0]
            : 'Residence Is Required';
        passwordErrorText = response['errors']['password'] != null
            ? response['errors']['password'][0]
            : 'Password is Required';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
        key: _scaffoldMessengerKey,
        child: Scaffold(
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
                      height: 3.0,
                    ),
                    reusableTextField('Enter Phone', Icons.phone, false,
                        _phoneTextController, phoneErrorText),
                    const SizedBox(
                      height: 3.0,
                    ),
                    reusableTextField('Enter Email', Icons.email, false,
                        _emailTextController, emailErrorText),
                    const SizedBox(
                      height: 3.0,
                    ),
                    reusableTextField('Enter County ', Icons.map, false,
                        _countyTextController, countyErrorText),
                    const SizedBox(
                      height: 3.0,
                    ),
                    reusableTextField('Enter Sub-County', Icons.map, false,
                        _subcountyTextController, subcountyErrorText),
                    const SizedBox(
                      height: 3.0,
                    ),
                    reusableTextField(
                        'Enter Area Of Residence',
                        Icons.area_chart_sharp,
                        false,
                        _residenceTextController,
                        residenceErrorText),
                    const SizedBox(
                      height: 3.0,
                    ),
                    reusableTextField('Enter Password', Icons.lock_outline,
                        true, _passwordTextController, passwordErrorText),
                    const SizedBox(
                      height: 3.0,
                    ),
                    reusableTextField(
                        'Enter Password Again',
                        Icons.lock_outline,
                        true,
                        _passwordConfirmationTextController,
                        passwordConfirmationErrorText),
                    const SizedBox(
                      height: 3.0,
                    ),
                    signInButton(
                      context,
                      false,
                      () {
                        _registerUser(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

//email regex validation
bool _isValidEmail(String email) {
  RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  return emailRegex.hasMatch(email);
}

void showSuccessToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP_RIGHT,
    timeInSecForIosWeb: 5,
    backgroundColor: Colors.green,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
