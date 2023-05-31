import 'package:firebase_auth/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../reusable_widgets/reusable.dart';
import '../utils/colors_utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _phoneTextController = TextEditingController();
  final TextEditingController _countyTextController = TextEditingController();
  final TextEditingController _residenceTextController =
      TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
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
                    _nameTextController),
                const SizedBox(
                  height: 30.0,
                ),
                reusableTextField(
                    'Enter Phone', Icons.phone, false, _phoneTextController),
                const SizedBox(
                  height: 30.0,
                ),
                reusableTextField('Enter County Name', Icons.map, false,
                    _countyTextController),
                const SizedBox(
                  height: 30.0,
                ),
                reusableTextField('Enter Area Of Residence',
                    Icons.area_chart_sharp, false, _residenceTextController),
                const SizedBox(
                  height: 30.0,
                ),
                reusableTextField(
                    'Enter Email', Icons.email, false, _emailTextController),
                const SizedBox(
                  height: 30.0,
                ),
                reusableTextField('Enter Password', Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 30.0,
                ),
                signInButton(
                  context,
                  false,
                  () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const HomeScreenPage(),
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
