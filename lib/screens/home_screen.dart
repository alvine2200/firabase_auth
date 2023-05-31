import 'package:firebase_auth/screens/login_screen.dart';
import 'package:flutter/material.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const LoginScreen()),
            );
          },
          child: const Text('Log Out'),
        ),
      ),
    );
  }
}
