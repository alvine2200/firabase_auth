import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ApiService {
  static const String baseUrl = 'http://127.0.0.1:8000/api/';

  Future<Map<String, dynamic>?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('${baseUrl}login'),
      headers: {'Content-type': 'application/json'},
      body: jsonDecode({'email': email, 'password': password} as String),
    );

    if (response.statusCode == 200) {
      debugPrint('Ok');
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }
}
