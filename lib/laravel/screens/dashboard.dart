import 'package:firebase_auth/laravel/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Service/apiservice.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //logout function
  Future<void> _performLogout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    var apiService = ApiService();
    await apiService.logout(token);

    // Clear local session data
    prefs.remove('token');

    // Navigate to login or home screen
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SigninScreen(),
      ),
    );
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
