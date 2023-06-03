import 'package:firebase_auth/laravel/screens/login.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import '../Service/apiservice.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //logout function
  Future<void> _performLogout(BuildContext context) async {
    // final prefs = await SharedPreferences.getInstance();
    // final token = prefs.getString('token');

    // debugPrint(token);

    var apiService = ApiService();

    var response = await apiService.logout(context);

    if (response['status'] == true && response['errors'] == null) {
      //redirect to screen
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const SigninScreen(),
        ),
      );
      return;
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const SigninScreen(),
        ),
      );
    }
    // // Clear local session data
    // prefs.remove('token');
    // Navigate to login or home screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _performLogout(context);
          },
          child: const Text('Log Out'),
        ),
      ),
    );
  }
}
